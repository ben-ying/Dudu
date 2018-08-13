import os

from django.db import models
from PIL import Image
from dateutil.relativedelta import relativedelta
from datetime import datetime
from shutil import copyfile

from myproject.settings import BASE_DIR
from myproject.settings import MEDIA_URL
from myproject.settings import MEDIA_ROOT
from myproject.settings import BIRTHDAY
from myproject.settings import PHOTO_DIR

THUMBNAIL_DIR = "thumbnail"
DEFAULT_THUMBNAIL_SIZE = 320


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
    directory = models.CharField('directory', max_length=200)
    sha1sum = models.CharField('sha1sum', max_length=50)
    category = models.IntegerField('category', default = 0)
    version = models.IntegerField('version', default = 0)
    description = models.CharField('description', max_length=1024, blank=True, null=True)
    pub_date = models.DateTimeField('date published', auto_now_add=True)
    modify_date = models.DateTimeField('date modified', auto_now=True)

    def get_url(self):
        return os.path.join(self.directory, self.name)

    def set_photo_directory(self, src_file_name, src_file_path, dest_dir_name, datetime_original):
        photo_dir = os.path.join(MEDIA_ROOT, PHOTO_DIR, dest_dir_name)
        delta = relativedelta(datetime.strptime(
            datetime_original.split(" ")[0], '%Y-%m-%d'), 
            datetime.strptime(BIRTHDAY, '%Y-%m-%d'))

        if delta.years == 0:
            dest_sub_dir = str(delta.months + 1) + "M"
        else:
            dest_sub_dir = str(delta.years + 1) + "Y"

        img_dir = os.path.join(photo_dir, dest_sub_dir)
        os.makedirs(os.path.join(img_dir, THUMBNAIL_DIR), exist_ok=True)
        #os.rename(src_file_path, os.path.join(img_dir, src_file_name))
        copyfile(src_file_path, os.path.join(img_dir, src_file_name))
        self.directory = os.path.join(MEDIA_URL, PHOTO_DIR, dest_dir_name, dest_sub_dir)


    def get_thumbnail_directory(self):
        return os.path.join(self.directory, THUMBNAIL_DIR)

    def get_thumbnail_url(self):
        return os.path.join(self.get_thumbnail_directory(), self.name)

    def save_thumbnail_image(self, height = DEFAULT_THUMBNAIL_SIZE, width = DEFAULT_THUMBNAIL_SIZE):
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

    def save_default_thumbnail_image(self):
        return self.save_thumbnail_image(DEFAULT_THUMBNAIL_SIZE, 0)

    def save(self, *args, **kwargs):
        self.save_default_thumbnail_image()
        super(Photo, self).save(*args, **kwargs)
    
    def __str__(self):
        return self.name


