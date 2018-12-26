from rest_framework import serializers

from iaer.models import Setting


class SettingSerializer(serializers.ModelSerializer):
    setting_id = serializers.IntegerField(read_only=True, source="id")
    user_id = serializers.IntegerField(read_only=True, source="user.id")

    class Meta:
        model = Setting
        fields = ['setting_id', 'user_id', 'home_show_current', 'home_show_this_month', 'home_show_this_year', 'monthly_fund', 'yearly_fund', 'created', 'modified']
