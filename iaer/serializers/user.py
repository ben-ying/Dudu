from rest_framework import serializers

from iaer.models import User, Fund


class UserSerializer(serializers.ModelSerializer):
    user_id = serializers.IntegerField(read_only=True, source="id")
    username = serializers.CharField(read_only=True, max_length=100, source="auth_user.username")
    email = serializers.CharField(read_only=True, max_length=100, source="auth_user.email")

    class Meta:
        model = User
        fields = ['user_id', 'username', 'profile', 'email', 'phone', 'gender', 'user_type', 'region', 'zone', 'locale', 'whats_up', 'birthday', 'hobbies', 'highlighted', 'is_email_activate', 'is_phone_activate', 'modified', 'created']


class FundSerializer(serializers.ModelSerializer):
    fund_id = serializers.IntegerField(read_only=True, source="id")
    
    class Meta:
        model = Fund
        fields = ['fund_id', 'name', 'monthly_money', 'yearly_money', 'alternate_money', 'created', 'modified']


