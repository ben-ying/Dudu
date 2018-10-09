from django.contrib import admin
from django.utils.html import format_html

from .models.photo_model import Photo
from .models.user_model import User


class PhotoAdmin(admin.ModelAdmin):
    def url(self, obj):
        return format_html("<a href='{url}'>{url}</a>", url=obj.get_image_url())

    list_display=('id', 'name', 'user', 'exif_image_width', 'exif_image_height', 'get_read_size', 'url', 'thumbnail', 'duration', 'exif_model', 'exif_datetime', 'category', 'pub_date', 'modify_date')
    readonly_fields=('name', 'sub_dir', 'version', 'size', 'exif_image_width', 'exif_image_height', 'exif_make', 'exif_model', 'exif_lens_make', 'exif_lens_model', 'exif_version', 'exif_subject_location', 'exif_datetime', 'exif_datetime_original', 'exif_datetime_digitized', 'duration', 'sha1sum', 'category', 'pub_date', 'modify_date')

admin.site.register(Photo, PhotoAdmin)

class UserAdmin(admin.ModelAdmin):
    list_display = ('auth_user', 'phone', 'zone', 'locale', 'profile', 'created', 'modified')
    search_fields = ('auth_user', 'phone')

admin.site.register(User, UserAdmin)
