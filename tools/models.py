from django.db import models



class Currency(models.Model):
    code = models.CharField(max_length=10)
    name = models.CharField(max_length=50)
    sequence = models.IntegerField(default=0)
    created = models.DateTimeField(editable=False)
    modified = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.code

    class Meta:
        ordering = ['sequence',]



class Exchange(models.Model):
    from_currency = models.ForeignKey(Currency, related_name='from_currency', on_delete=models.CASCADE)
    to_currency = models.ForeignKey(Currency, related_name='to_currency', on_delete=models.CASCADE)
    f_buy_price = models.FloatField() # 现汇买入价
    m_buy_price = models.FloatField() # 现钞买入价
    f_sell_price = models.FloatField() # 现汇卖出价
    m_sell_price = models.FloatField() # 现钞卖出价
    bank_conversion_price = models.FloatField() # 银行折算价/中间价
    created = models.DateTimeField(editable=False)
    modified = models.DateTimeField(auto_now=True)



