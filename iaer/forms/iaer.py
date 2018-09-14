from django import forms

from iaer.models import Iaer

class IaerForm(forms.ModelForm):
    MONEY_CHOICES = (
        (u'收入', u'收入'),
        (u'支出', u'支出'),
    )

    iaer_type = forms.ChoiceField(choices=MONEY_CHOICES) 

    class Meta:
        model = Iaer
        fields = ['category', 'iaer_type', 'money', 'remark']
