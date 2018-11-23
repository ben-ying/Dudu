from rest_framework import serializers

from iaer.models import Category


class CategorySerializer(serializers.ModelSerializer):
    category_id = serializers.IntegerField(read_only=True, source="id")

    class Meta:
        model = Category
        fields = ['category_id', 'name', 'sequence', 'created', 'modified']
