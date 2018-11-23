from rest_framework import serializers

from iaer.models import Category


class CategorySerializer(serializers.ModelSerializer):

    class Meta:
        model = Category
        fields = ['name', 'sequence', 'created', 'modified']
