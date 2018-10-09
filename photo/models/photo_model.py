import os
import pdb
import photo

from PIL import Image
from django.db import models
from PIL import Image
from dateutil.relativedelta import relativedelta
from datetime import datetime
from shutil import copyfile
from django.contrib.postgres.fields import ArrayField
from django.utils.safestring import mark_safe
from django.utils.html import format_html

from .abstract_model import Exif
from .user_model import User
from myproject.settings import MEDIA_URL
from myproject.settings import PHOTO_APP_MEDIA_URL
from myproject.settings import PHOTO_APP_MEDIA_ROOT

THUMBNAIL_DIR = "thumbnail"
DEFAULT_THUMBNAIL_SIZE = 160


class Photo(Exif):
    user = models.ForeignKey(User, verbose_name='user', related_name='photos', blank=True, null=True, on_delete=models.CASCADE)
    name = models.CharField('name', max_length=50)
    size = models.PositiveIntegerField('size', default = 0)
    group = models.ForeignKey('Group', on_delete=models.CASCADE, blank=True, null=True)
    labels = ArrayField(models.CharField('label', max_length=50), blank=True, null=True)
    sub_dir = models.CharField('sub_dir', max_length = 10)
    duration = models.DurationField('duration')
    sha1sum = models.CharField('sha1sum', max_length=50)
    category = models.PositiveSmallIntegerField('category', default = 0)
    version = models.PositiveSmallIntegerField('version', default = 0)
    description = models.TextField('description', max_length=1024, blank=True, null=True)
    pub_date = models.DateTimeField('date published', auto_now_add=True)
    modify_date = models.DateTimeField('date modified', auto_now=True)

    def get_username(self):
        if self.user:
            return self.user.auth_user.username
        else:
            return 'anonymous'

    def get_age_description(self):
        delta = self._get_relativedelta()
        description = ""

        if delta.years > 0:
            description += str(delta.years) + "年"
        if delta.months > 0:
            description += str(delta.months) + "个月"
        if delta.days > 0:
            description += "零" + str(delta.days) + "天"

        if description:
            return description
        else:
            return "出生日"

    def get_read_size(self):
        if self.size / 1024 < 1:
            return str(self.size) + "B"
        elif self.size / 1024 / 1024 < 1:
            return "{:.1f}".format(self.size / 1024) + "KB"
        elif self.size / 1024 / 1024 / 1024 < 1:
            return "{:.1f}".format(self.size / 1024 / 1024) + "MB"
        elif self.size / 1024 / 1024 / 1024 / 1024 < 1:
            return "{:.1f}".format(self.size / 1024 / 1024 / 1024) + "GB"

    get_read_size.short_description = 'size'
    
    def get_sub_dir_description(self):
        return self.sub_dir.replace("M", "个月").replace("Y", "岁")

    def get_image_directory(self):
        return os.path.join(PHOTO_APP_MEDIA_ROOT, self.get_username(), self.sub_dir)

    def get_image_url(self):
        return os.path.join(PHOTO_APP_MEDIA_URL, self.get_username(), self.sub_dir, self.name)

    def get_thumbnail_directory(self):
        return os.path.join(PHOTO_APP_MEDIA_ROOT, self.get_username(), self.sub_dir, THUMBNAIL_DIR)

    def get_thumbnail_url(self):
        return os.path.join(PHOTO_APP_MEDIA_URL, self.get_username(), self.sub_dir, THUMBNAIL_DIR, self.name)

    def get_thumbnail_image_path(self):
        return os.path.join(self.get_thumbnail_directory(), self.name)

    def classification(self, src_file_name, src_file_path):
        delta = self._get_relativedelta()
        self.duration = self._get_timedelta() 

        if delta.years == 0:
            dest_sub_dir = str(delta.months + 1) + "M"
        else:
            dest_sub_dir = str(delta.years + 1) + "Y"

        self.sub_dir = dest_sub_dir

        img_dir = os.path.join(PHOTO_APP_MEDIA_ROOT, self.user.auth_user.username, dest_sub_dir)
        os.makedirs(os.path.join(img_dir, THUMBNAIL_DIR), exist_ok=True)
        os.rename(src_file_path, os.path.join(img_dir, src_file_name))

    def save(self, *args, **kwargs):
        if not self.exif_image_width or not self.exif_image_height:
            im = Image.open(os.path.join(PHOTO_APP_MEDIA_ROOT, self.user.auth_user.username, self.sub_dir, self.name))
            self.exif_image_width, self.exif_image_height = im.size
        self._save_default_thumbnail_image()
        super(Photo, self).save(*args, **kwargs)

    def url_link(self):
        return format_html("<a href='{url}'>{thumbnail}</a>",
                url=self.get_image_url(), thumbnail=mark_safe('<img src="%s" />' % self.get_thumbnail_url()))
    url_link.short_description = 'url'
    
    def _get_relativedelta(self):
        return relativedelta(datetime.strptime(
            str(self.exif_datetime_original), '%Y-%m-%d'), self.user.birthday)

    def _get_timedelta(self):
        if not self.user.birthday:
            print("User not set birthday")
        return datetime.strptime(str(self.exif_datetime_original), '%Y-%m-%d') \
            - self.user.birthday

    def _save_thumbnail_image(self, height = DEFAULT_THUMBNAIL_SIZE, width = DEFAULT_THUMBNAIL_SIZE):
        if os.path.exists(self.get_thumbnail_image_path()):
            print("File already exists")
            return

        if height > 0:
            rate = float(self.exif_image_height) / height
            width = float(self.exif_image_width) / rate
        else:
            rate = float(self.exif_image_width) / width
            height = float(self.exif_image_height) / rate

        size = int(width), int(height) 
        im = Image.open(os.path.join(PHOTO_APP_MEDIA_ROOT, self.get_username(), self.sub_dir, self.name))
        im.thumbnail(size, Image.ANTIALIAS)
        im.save(self.get_thumbnail_image_path(), "JPEG")
        im.close()

    def _save_default_thumbnail_image(self):
        return self._save_thumbnail_image(DEFAULT_THUMBNAIL_SIZE, 0)

    def __str__(self):
        return self.name


class Group(models.Model):
    name = models.CharField('name', max_length=50)
    description = models.TextField('description', max_length=1024, blank=True, null=True)

    def __str__(self):
        return self.name
