from django.contrib import admin

from .models import Currency
from .models import Exchange



class CurrencyAdmin(admin.ModelAdmin):
    list_display = ('code', 'name', 'sequence', 'created', 'modified')
    fields = ('code', 'name', 'sequence')
    search_fields = ('code', 'name')
    readonly_fields = ('code',)
admin.site.register(Currency, CurrencyAdmin)


class ExchangeAdmin(admin.ModelAdmin):
    list_display = ('from_currency', 'to_currency', 'transaction_unit', 'f_buy_price', \
            'm_buy_price', 'f_sell_price', 'm_sell_price', 'bank_conversion_price', 'created', 'modified')
    search_fields = ('from_currency', 'to_currency')
admin.site.register(Exchange, ExchangeAdmin)
