from django.db.models import Q
from django.http import HttpResponse
from django.utils import timezone

from urllib.parse import urlencode

from tools.constants import CODE_NOT_EXISTS
from tools.constants import CODE_SUCCESS
from tools.constants import MSG_GET_EXCHANGE_RATE_SUCCESS
from tools.constants import MSG_CURRENCY_NOT_EXISTS
from tools.models import Currency
from tools.models import ExchangeRate
from tools.serializers.exchange import ExchangeRateSerializer
from tools.utils import simple_json_response
from tools.utils import json_response
from tools.utils import CustomModelViewSet

import json, urllib

APP_KEY = '99fb8dacdb770414fa023e89b059518f'
SUCCESS_ERROR_CODE = 0



class ExchangeViewSet(CustomModelViewSet):
    serializer_class = ExchangeRateSerializer

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        print(str(super(ExchangeViewSet, self).list(request, *args, **kwargs).data))
        if len(queryset) > 0:
            return json_response(super(ExchangeViewSet, self).list(request, *args, **kwargs).data, CODE_SUCCESS, MSG_GET_EXCHANGE_RATE_SUCCESS)
        else:
            return json_response(super(ExchangeViewSet, self).list(request, *args, **kwargs).data, CODE_NOT_EXISTS, MSG_CURRENCY_NOT_EXISTS)

    def get_queryset(self):
        from_currency = self.request.query_params.get('from_currency')
        to_currency = self.request.query_params.get('to_currency')
        url = 'http://op.juhe.cn/onebox/exchange/currency'

        from_currencies = Currency.objects.filter(code = from_currency)
        to_currencies = Currency.objects.filter(code = to_currency)
        if not from_currency or not to_currency:
            return ExchangeRate.objects.none()
        rates = ExchangeRate.objects.filter(Q(from_currency = from_currencies[0], to_currency = to_currencies[0]) \
                | Q(from_currency = to_currencies[0], to_currency = from_currencies[0]))
        if rates and not rates[0].is_expired():
            return rates

        params = {
            'from' : from_currency, 
            'to' : to_currency, 
            'key' : APP_KEY, 
        }
        code, results = get_response_data(url, params, self.request.method)
        print(results)
        if code == SUCCESS_ERROR_CODE:
            for item in results:
                from_currency_s = Currency.objects.get(code = item['currencyF'])
                to_currency_s = Currency.objects.get(code = item['currencyT'])
                exchange_rate, created = ExchangeRate.objects.update_or_create(
                        from_currency = from_currency_s, defaults = {'from_currency': from_currency_s, \
                                'to_currency': to_currency_s, \
                                'exchange': item['exchange'], \
                                'result': item['result'], \
                                'update_time': item['updateTime'], \
                                }        
                )
                if created:
                    exchange_rate.created = timezone.now()
                    exchange_rate.save()
            return ExchangeRate.objects.filter(Q(from_currency = from_currency_s, to_currency = to_currency_s) \
                    | Q(from_currency = to_currency_s, to_currency = from_currency_s))
        else:
            return ExchangeRate.objects.none()


def get_response_data(url, params, method='GET'):
    params = urlencode(params)
    if method =='GET':
        f = urllib.request.urlopen('%s?%s' % (url, params))
    else:
        f = urllib.request.urlopen(url, params)

    content = f.read()
    res = json.loads(content.decode('utf-8'))
    if res:
        error_code = res['error_code']
        if error_code == SUCCESS_ERROR_CODE:
            return error_code, res['result']
        else:
            return error_code, res['reason']
    else:
        return 1404, 'request api error'

