from django.utils import timezone

from tools.models import Currency
from tools.models import Exchange
from tools.exchange_views import SUCCESS_ERROR_CODE
from tools.exchange_views import APP_KEY
from tools.exchange_views import get_response_data



# Every one hour execute once 
# crontab: 0 */1 * * * ~/app/venv/bin/python ~/app/DjangoApps/manage.py runscript exchange_init_common_currency_rate_by_frequency > /tmp/cronlog.txt 2>&1
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
                print('%s Exchange %s created!' %(str(exchange.created), exchange))
            else:
                print('%s Exchange %s updated!' %(str(exchange.created), exchange))
    else:
        print('%s: %s' %(error_code, message))
