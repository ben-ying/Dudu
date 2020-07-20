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
            return error_code, res['result']
        else:
            return error_code, res['reason']
    else:
        return 1404, 'request api error'

