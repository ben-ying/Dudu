from django.utils import timezone

from tools.models import Currency
from tools.exchange_views import SUCCESS_ERROR_CODE
from tools.exchange_views import APP_KEY
from tools.exchange_views import get_response_data



# Execute only once
def run():
    url = 'http://op.juhe.cn/onebox/exchange/list'
    params = {
        'key' : APP_KEY, 
    }

    error_code, message = get_response_data(url, params, 'GET')
    if error_code == SUCCESS_ERROR_CODE:
        currency_list = message['list']
        for item in currency_list:
            name_s = item['name']
            code_s = item['code']
            currency, created = Currency.objects.update_or_create(
                code = code_s, defaults = {'name': name_s, 'code': code_s}
            )
            if created:
                currency.created = timezone.now()
                currency.save()
                print('%s Currency %s(%s) created!' %(str(currency.created), code_s, name_s))
            else:
                print('%s Currency %s(%s) updated!' %(str(currency.created), code_s, name_s))
    else:
        print('%s: %s' %(error_code, message))
