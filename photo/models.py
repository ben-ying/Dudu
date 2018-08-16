import os

from django.db import models
from PIL import Image
from dateutil.relativedelta import relativedelta
from datetime import datetime
from shutil import copyfile
from django.contrib.postgres.fields import ArrayField

from myproject.settings import BASE_DIR
from myproject.settings import MEDIA_URL
from myproject.settings import MEDIA_ROOT
from myproject.settings import BIRTHDAY
from myproject.settings import PHOTO_DIR

THUMBNAIL_DIR = "thumbnail"
DEFAULT_THUMBNAIL_SIZE = 160


class Photo(models.Model):
    # exif
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
     # custom
    name = models.CharField('name', max_length=50)
    directory = models.CharField('directory', max_length=200)
    labels = ArrayField(models.CharField('label', max_length=50), blank=True, null=True)
    sub_dir = models.CharField('sub_dir', max_length = 10)
    duration = models.DurationField('duration')
    sha1sum = models.CharField('sha1sum', max_length=50)
    category = models.PositiveSmallIntegerField('category', default = 0)
    version = models.PositiveSmallIntegerField('version', default = 0)
    description = models.TextField('description', max_length=1024, blank=True, null=True)
    pub_date = models.DateTimeField('date published', auto_now_add=True)
    modify_date = models.DateTimeField('date modified', auto_now=True)

    def get_url(self):
        return os.path.join(self.directory, self.name)

    def _get_relativedelta(self):
        return relativedelta(datetime.strptime(
            str(self.exif_datetime_original), '%Y-%m-%d'),
            datetime.strptime(BIRTHDAY, '%Y-%m-%d'))

    def _get_timedelta(self):
        return datetime.strptime(str(self.exif_datetime_original), '%Y-%m-%d'), \
            - datetime.strptime(BIRTHDAY, '%Y-%m-%d')

    def get_age_description(self):
        delta = self._get_relativedelta()
        description = ""

        if delta.years > 0:
            description += str(delta.years) + "年"
        if delta.months > 0:
            description += str(delta.months) + "个月"
        if delta.days > 0:
            description += str(delta.days) + "天"

        if description:
            return description
        else:
            return "出生日"


    def set_photo_directory(self, src_file_name, src_file_path, dest_dir_name):
        photo_dir = os.path.join(MEDIA_ROOT, PHOTO_DIR, dest_dir_name)
        delta = self._get_relativedelta()
        self.duration = self._get_timedelta() 

        if delta.years == 0:
            dest_sub_dir = str(delta.months + 1) + "M"
        else:
            dest_sub_dir = str(delta.years + 1) + "Y"

        self.sub_dir = dest_sub_dir

        img_dir = os.path.join(photo_dir, dest_sub_dir)
        os.makedirs(os.path.join(img_dir, THUMBNAIL_DIR), exist_ok=True)
        #os.rename(src_file_path, os.path.join(img_dir, src_file_name))
        copyfile(src_file_path, os.path.join(img_dir, src_file_name))
        self.directory = os.path.join(MEDIA_URL, PHOTO_DIR, dest_dir_name, dest_sub_dir)


    def get_thumbnail_directory(self):
        return os.path.join(self.directory, THUMBNAIL_DIR)

    def get_thumbnail_url(self):
        return os.path.join(self.get_thumbnail_directory(), self.name)

    def _save_thumbnail_image(self, height = DEFAULT_THUMBNAIL_SIZE, width = DEFAULT_THUMBNAIL_SIZE):
        if os.path.exists(BASE_DIR + self.get_thumbnail_url()):
            print("File already exists")
            return

        if height > 0:
            rate = float(self.exif_image_height) / height
            width = float(self.exif_image_width) / rate
        else:
            rate = float(self.exif_image_width) / width
            height = float(self.exif_image_height) / rate

        url = self.get_url()
        size = int(width), int(height) 
        im = Image.open(BASE_DIR + self.get_url())
        im.thumbnail(size, Image.ANTIALIAS)
        im.save(BASE_DIR + self.get_thumbnail_url(), "JPEG")
        im.close()

    def _save_default_thumbnail_image(self):
        return self._save_thumbnail_image(DEFAULT_THUMBNAIL_SIZE, 0)

    def save(self, *args, **kwargs):
        self._save_default_thumbnail_image()
        super(Photo, self).save(*args, **kwargs)
    
    def __str__(self):
        return self.name


