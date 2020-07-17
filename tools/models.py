from django.db import models



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



class Exchange(models.Model):
    from_currency = models.ForeignKey(Currency, related_name='from_currency', on_delete=models.CASCADE)
    to_currency = models.ForeignKey(Currency, related_name='to_currency', on_delete=models.CASCADE)
    transaction_unit = models.PositiveIntegerField(default=1) 
    f_buy_price = models.FloatField() # 现汇买入价
    m_buy_price = models.FloatField() # 现钞买入价
    f_sell_price = models.FloatField() # 现汇卖出价
    m_sell_price = models.FloatField() # 现钞卖出价
    bank_conversion_price = models.FloatField() # 银行折算价/中间价
    created = models.DateTimeField(editable=False, blank=True, null=True)
    modified = models.DateTimeField(auto_now=True)

    def __str__(self):
        return '%s exchange to %d %s: %s' %(self.from_currency, self.transaction_unit, self.to_currency, self.f_buy_price)
