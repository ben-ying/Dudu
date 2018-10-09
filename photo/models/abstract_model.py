from django.db import models


DATE_FORMAT_CHOICES = (
            (u'0', u'不显示'),
            (u'1', u'显示日期'),
            (u'2', u'显示年龄'),
            (u'3', u'显示日期和年龄'),
        )

class Exif(models.Model):
    exif_image_width = models.PositiveSmallIntegerField('image width', blank=True, null=True)
    exif_image_height = models.PositiveSmallIntegerField('image height', blank=True, null=True)
    exif_make = models.CharField('make', max_length=50, blank=True, null=True)
    exif_model = models.CharField('model', max_length=100, blank=True, null=True)
    exif_lens_make = models.CharField('lens make', max_length=50, blank=True, null=True)
    exif_lens_model = models.CharField('lens model', max_length=100, blank=True, null=True)
    exif_version = models.CharField('exif version', max_length=10, blank=True, null=True)
    exif_subject_location = models.CharField('subject location', max_length=30, blank=True, null=True)
    exif_datetime = models.DateField('datetime', blank=True, null=True)
    exif_datetime_original = models.DateField('datetime original', blank=True, null=True)
    exif_datetime_digitized = models.DateField('datetime digitized', blank=True, null=True)

    class Meta:
        abstract = True

