from rest_framework import serializers

from tools.models import ExchangeRate



class ExchangeRateSerializer(serializers.ModelSerializer):
    from_currency_name = serializers.CharField(read_only=True, max_length=50, source="from_currency.name")
    from_currency_code = serializers.CharField(read_only=True, max_length=10, source="from_currency.code")
    to_currency_name = serializers.CharField(read_only=True, max_length=50, source="to_currency.name")
    to_currency_code = serializers.CharField(read_only=True, max_length=10, source="to_currency.code")

    class Meta:
        model = ExchangeRate
        fields = ['from_currency_name', 'to_currency_name', 'from_currency_code', 'to_currency_code', 'exchange', 'result', 'update_time', 'created', 'modified']
