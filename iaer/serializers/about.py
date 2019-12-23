from rest_framework import serializers

from iaer.models import About


class AboutSerializer(serializers.ModelSerializer):
    about_id = serializers.IntegerField(read_only=True, source="id")
    apk_url = serializers.SerializerMethodField()

    class Meta:
        model = About
        fields = ['about_id', 'version_name', 'version_code', 'apk_url', 'category', 'comment', 'datetime']

    def get_apk_url(self, about):
        request = self.context.get('request')
        if about.apk:
            apk_url = about.apk.url
            return request.build_absolute_uri(apk_url)
        else:
            return ''
