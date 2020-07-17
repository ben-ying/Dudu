from django.http import HttpResponse
from django.utils import timezone

from urllib.parse import urlencode

import json, urllib

APP_KEY = '99fb8dacdb770414fa023e89b059518f'
SUCCESS_ERROR_CODE = 0



def index(request):
   return HttpResponse('Hello, world!')


def exchange(request):
    # https://code.juhe.cn/docs/1070
    code, message = query_exchange_data(request.query_params.get('from_currency'), request.query_params.get('to_currency'), 'GET')
    print(message)
    return HttpResponse('%s:%s' %(code, message))


def query_exchange_rate(method='GET'):
    url = 'http://op.juhe.cn/onebox/exchange/query'
    params = {
        'key' : APP_KEY, 
    }

    error_code, message = get_response_data(url, params, method)
    if error_code == SUCCESS_ERROR_CODE:
        name = message['list'][0]
        code = message['list'][1]
        Currency.objects.update_or_create(
            code=code, defaults={'name': name, 'code': code, 'created': timezone.now()}
        )


def query_specific_exchange_rate(from_currency, to_currency, method='GET'):
    url = 'http://op.juhe.cn/onebox/exchange/currency'
    params = {
        'from' : from_currency, 
        'to' : to_currency, 
        'key' : APP_KEY, 
    }

    return get_response_data(url, params, method)


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
            print('%s: %s' %(res['error_code'], res['result']))
            return error_code, res['result']
        else:
            print('%s: %s' %(res['error_code'], res['reason']))
            return error_code, res['reason']
    else:
        print('1404: request api error')
        return 1404, 'request api error'

