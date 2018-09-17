from django import forms
from django.utils.translation import gettext as _

from iaer.models import Iaer


class IaerForm(forms.ModelForm):
    remark = forms.CharField(required=True)

    class Meta:
        model = Iaer
        fields = ['category', 'money', 'remark']
        labels = {
                'category': _('类别'),
                'money': _('金额'),
                'remark': _('备注'),
                }


