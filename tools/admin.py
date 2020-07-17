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
    search_fields = ('from_currency', 'to_currency')
admin.site.register(Exchange, ExchangeAdmin)
