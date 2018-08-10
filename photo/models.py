from django.db import models


class Photo(models.Model):
    # exif
    exif_image_width = models.IntegerField('image width', blank=True, null=True)
    exif_image_height = models.IntegerField('image height', blank=True, null=True)
    exif_make = models.CharField('make', max_length=50, blank=True, null=True)
    exif_model = models.CharField('model', max_length=100, blank=True, null=True)
    exif_lens_make = models.CharField('lens make', max_length=50, blank=True, null=True)
    exif_lens_model = models.CharField('lens model', max_length=100, blank=True, null=True)
    exif_version = models.CharField('exif version', max_length=10, blank=True, null=True)
    exif_subject_location = models.CharField('subject location', max_length=30, blank=True, null=True)
    exif_datetime = models.DateTimeField('datetime', blank=True, null=True)
    exif_datetime_original = models.DateTimeField('datetime original', blank=True, null=True)
    exif_datetime_digitized = models.DateTimeField('datetime digitized', blank=True, null=True)
     # custom
    name = models.CharField('name', max_length=50)
    sha1sum = models.CharField('sha1sum', max_length=50)
    category = models.IntegerField('category', default = 0)
    description = models.CharField('description', max_length=1024, blank=True, null=True)
    pub_date = models.DateTimeField('date published', auto_now_add=True)
    modify_date = models.DateTimeField('date modified', auto_now=True)
