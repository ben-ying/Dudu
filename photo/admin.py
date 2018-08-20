from django.contrib import admin
from django.utils.html import format_html

from .models import Photo
from .models import User


class PhotoAdmin(admin.ModelAdmin):
    def url_link(self, obj):
        return format_html("<a href='{url}'>{url}</a>", url=obj.get_url())
    url_link.short_description = "url"

    def thumbnail_link(self, obj):
        return format_html("<a href='{url}'>{url}</a>", url=obj.get_thumbnail_url())
    url_link.short_description = "thumbnail"

    list_display=('id', 'name', 'user', 'exif_image_width', 'exif_image_height', 'url_link', 'thumbnail_link', 'duration', 'exif_model', 'exif_datetime', 'category', 'pub_date', 'modify_date')
    readonly_fields=('exif_image_width', 'exif_image_height', 'exif_make', 'exif_model', 'exif_lens_make', 'exif_lens_model', 'exif_version', 'exif_subject_location', 'exif_datetime', 'exif_datetime_original', 'exif_datetime_digitized', 'duration', 'sha1sum', 'category', 'pub_date', 'modify_date')

admin.site.register(Photo, PhotoAdmin)

class UserAdmin(admin.ModelAdmin):
    list_display = ('auth_user', 'phone', 'zone', 'locale', 'profile', 'created', 'modified')
    search_fields = ('auth_user', 'phone')

admin.site.register(User, UserAdmin)
