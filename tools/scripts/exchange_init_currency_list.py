from django.utils import timezone

from tools.models import Currency
from tools.views.exchange_views import SUCCESS_ERROR_CODE
from tools.views.exchange_views import APP_KEY
from tools.views.exchange_views import get_response_data



# Execute only once
# https://django-extensions.readthedocs.io/en/latest/runscript.html
# ~/app/venv/bin/python ~/app/DjangoApps/manage.py runscript exchange_init_currency_list  
def run():
    url = 'http://op.juhe.cn/onebox/exchange/list'
    params = {
        'key' : APP_KEY, 
    }

    error_code, message = get_response_data(url, params, 'GET')
    if error_code == SUCCESS_ERROR_CODE:
        currency_list = message['list']
        i = 0
        for item in currency_list:
            i += 1
            name_s = item['name']
            code_s = item['code']
            currency, created = Currency.objects.update_or_create(
                code = code_s, defaults = {'name': name_s, 'code': code_s}
            )
            if created:
                currency.sequence = i
                currency.created = timezone.now()
                currency.save()
                print('%s Currency %s(%s) created!' %(str(currency.created), code_s, name_s))
            else:
                print('%s Currency %s(%s) updated!' %(str(currency.created), code_s, name_s))
    else:
        print('%s: %s' %(error_code, message))
