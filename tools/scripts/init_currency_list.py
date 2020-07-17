from django.utils import timezone

from tools.models import Currency
from tools.views import SUCCESS_ERROR_CODE
from tools.views import APP_KEY
from tools.views import get_response_data



# Every xxx(crontab) execute once 
# Execute only once
def run():
    url = 'http://op.juhe.cn/onebox/exchange/list'
    params = {
        'key' : APP_KEY, 
    }

    error_code, message = get_response_data(url, params, 'GET')
    if error_code == SUCCESS_ERROR_CODE:
        currency_list = message['list']
        print(len(currency_list))
        for item in currency_list:
            name = item['name']
            code = item['code']
            currency, created = Currency.objects.update_or_create(
                code=code, defaults={'name': name, 'code': code}
            )
            if created:
                print('Currency %s(%s) create!' %(code, name))
            else:
                print('Currency %s(%s) updated!' %(code, name))
    else:
        print('%s: %s' %(error_code, message))
