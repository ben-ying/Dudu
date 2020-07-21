from django.contrib import admin

from .models import Currency
from .models import CommonExchange
from .models import ExchangeRate



class CurrencyAdmin(admin.ModelAdmin):
    list_display = ('code', 'name', 'sequence', 'created', 'modified')
    fields = ('code', 'name', 'sequence')
    search_fields = ('code', 'name')
    readonly_fields = ('code',)
admin.site.register(Currency, CurrencyAdmin)


class CommonExchangeAdmin(admin.ModelAdmin):
    list_display = ('from_currency', 'to_currency', 'transaction_unit', 'f_buy_price', \
            'm_buy_price', 'f_sell_price', 'm_sell_price', 'bank_conversion_price', 'created', 'modified')
    search_fields = ('from_currency', 'to_currency')
admin.site.register(CommonExchange, CommonExchangeAdmin)


class ExchangeRateAdmin(admin.ModelAdmin):
    list_display = ('from_currency', 'to_currency', 'exchange', 'result', 'update_time', 'created', 'modified')
    fields = ('from_currency', 'to_currency', 'exchange', 'result', 'update_time', 'created', 'modified')
    search_fields = ('from_currency', 'to_currency', 'exchange', 'result')
    readonly_fields = ('from_currency', 'to_currency', 'exchange', 'result', 'update_time', 'created', 'modified')
admin.site.register(ExchangeRate, ExchangeRateAdmin)
