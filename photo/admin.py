from .models import Photo
from django.contrib import admin

class PhotoAdmin(admin.ModelAdmin):
    list_display=('name', 'exif_image_width', 'exif_image_height', 'exif_model', 'exif_datetime', 'category', 'pub_date', 'modify_date')
    readonly_fields=('exif_image_width', 'exif_image_height', 'exif_make', 'exif_model', 'exif_lens_make', 'exif_lens_model', 'exif_version', 'exif_subject_location', 'exif_datetime', 'exif_datetime_original', 'exif_datetime_digitized', 'sha1sum', 'category', 'pub_date', 'modify_date')

admin.site.register(Photo, PhotoAdmin)
