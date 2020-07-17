from django.utils import timezone

from tools.models import Currency
from tools.models import Exchange
from tools.views import SUCCESS_ERROR_CODE
from tools.views import APP_KEY
from tools.views import get_response_data



# Every xxx(crontab) execute once 
def run():
    url = 'http://op.juhe.cn/onebox/exchange/query'
    params = {
        'key' : APP_KEY, 
    }

    error_code, message = get_response_data(url, params, 'GET')
    if error_code == SUCCESS_ERROR_CODE:
        exchange_list = message['list']
        for item in exchange_list:
            from_currency_s = Currency.objects.get(name = item[0])
            to_currency_s = Currency.objects.get(code = 'CNY')
            transaction_unit_s = int(item[1])
            f_buy_price_s = float(item[2])
            m_buy_price_s = float(item[3])
            f_sell_price_s = float(item[4])
            m_sell_price_s = float(item[4])
            bank_conversion_price_s = float(item[5])
            create_s = timezone.now()
            exchange, created = Exchange.objects.update_or_create(
                    from_currency = from_currency_s, defaults = {'from_currency': from_currency_s, \
                            'to_currency': to_currency_s, \
                            'f_buy_price': f_buy_price_s, \
                            'transaction_unit': transaction_unit_s, \
                            'm_buy_price': m_buy_price_s, \
                            'f_sell_price': f_sell_price_s, \
                            'm_sell_price': m_sell_price_s, \
                            'bank_conversion_price': bank_conversion_price_s
                            }        
            )
            if created:
                exchange.created = timezone.now()
                exchange.save()
                print('Exchange %s created!' %(exchange))
            else:
                print('Exchange %s updated!' %(exchange))
    else:
        print('%s: %s' %(error_code, message))
