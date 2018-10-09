from django.contrib import admin
from django.utils.html import format_html

from .models.photo_model import Photo
from .models.photo_model import Gallery
from .models.user_model import User


class PhotoAdmin(admin.ModelAdmin):
    list_display=('id', 'name', 'user', 'exif_image_width', 'exif_image_height', 'get_read_size', 'duration', 'category', 'url_link')
    readonly_fields=('user', 'name', 'sub_dir', 'version', 'size', 'exif_image_width', 'exif_image_height', 'exif_make', 'exif_model', 'exif_lens_make', 'exif_lens_model', 'exif_version', 'exif_subject_location', 'exif_datetime', 'exif_datetime_original', 'exif_datetime_digitized', 'duration', 'sha1sum', 'category', 'pub_date', 'modify_date')

    def has_delete_permission(self, request, obj=None):
        return False

admin.site.register(Photo, PhotoAdmin)

class UserAdmin(admin.ModelAdmin):
    list_display = ('auth_user', 'phone', 'zone', 'locale', 'profile', 'created', 'modified')
    search_fields = ('auth_user', 'phone')

admin.site.register(User, UserAdmin)

class GalleryAdmin(admin.ModelAdmin):
    list_display = ('name', 'description')
    search_fields = ('name', 'description')

admin.site.register(Gallery, GalleryAdmin)
