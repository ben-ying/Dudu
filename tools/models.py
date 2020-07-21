from django.db import models
from django.utils import timezone

import datetime



class Currency(models.Model):
    code = models.CharField(max_length=10, unique=True)
    name = models.CharField(max_length=50, unique=True)
    sequence = models.IntegerField(default=0)
    created = models.DateTimeField(editable=False, blank=True, null=True)
    modified = models.DateTimeField(auto_now=True)

    def __str__(self):
        return '%s(%s)' %(self.code, self.name)

    class Meta:
        ordering = ['sequence',]



class CommonExchange(models.Model):
    from_currency = models.ForeignKey(Currency, related_name='common_from_currency', on_delete=models.CASCADE)
    to_currency = models.ForeignKey(Currency, related_name='common_to_currency', on_delete=models.CASCADE)
    transaction_unit = models.PositiveIntegerField(default=100) 
    f_buy_price = models.FloatField() # 现汇买入价
    m_buy_price = models.FloatField() # 现钞买入价
    f_sell_price = models.FloatField() # 现汇卖出价
    m_sell_price = models.FloatField() # 现钞卖出价
    bank_conversion_price = models.FloatField() # 银行折算价/中间价
    is_common = models.BooleanField()
    created = models.DateTimeField(editable=False, blank=True, null=True)
    modified = models.DateTimeField(auto_now=True)

    def __str__(self):
        return '%s exchange to %d %s: %s' %(self.from_currency, self.transaction_unit, self.to_currency, self.f_buy_price)


class ExchangeRate(models.Model):
    from_currency = models.ForeignKey(Currency, related_name='from_currency', on_delete=models.CASCADE)
    to_currency = models.ForeignKey(Currency, related_name='to_currency', on_delete=models.CASCADE)
    exchange = models.FloatField()
    result = models.FloatField()
    update_time = models.CharField(max_length=30)
    created = models.DateTimeField(editable=False, blank=True, null=True)
    modified = models.DateTimeField(auto_now=True)

    def is_expired(self):
        if timezone.now() < self.modified + datetime.timedelta(hours = 1):
            return False
        else:
            return True

