from django.db import models

from collections import defaultdict

from .abstract_model import DATE_FORMAT_CHOICES


class UserQuerySet(models.QuerySet):
    def boys(self):
        return self.filter(gender = 0)

    def girls(self):
        return self.filter(gender = 1)


class UserManager(models.Manager):
    def get_queryset(self):
        return UserQuerySet(self.model, using = self._db)

    def boys(self):
        return self.get_queryset().boys()

    def girls(self):
        return self.get_queryset().girls()


class User(models.Model):
    auth_user = models.OneToOneField('auth.User', on_delete=models.CASCADE)
    phone = models.CharField(max_length=30, blank=True, null=True)
    gender = models.PositiveSmallIntegerField(default=2) #0 for boy, 1 for girl, 2 for others
    profile = models.CharField(max_length=200, blank=True, null=True)
    date_format = models.CharField(max_length=50, choices=DATE_FORMAT_CHOICES, default='0')
    user_type = models.PositiveSmallIntegerField(default=0)
    region = models.CharField(max_length=100, blank=True, null=True)
    locale = models.CharField(max_length=10, blank=True, null=True)
    whats_up = models.CharField(max_length=200, blank=True, null=True)
    zone = models.CharField(max_length=50, blank=True, null=True)
    birthday = models.DateTimeField(blank=True, null=True)
    hobbies = models.TextField(max_length=500, blank=True, null=True)
    highlighted = models.TextField(blank=True, null=True)
    created = models.DateTimeField(editable=False, blank=True, null=True)
    modified = models.DateTimeField(auto_now=True, blank=True, null=True)
    is_email_activate = models.BooleanField(default=False)
    is_phone_activate = models.BooleanField(default=False)
    
    objects = models.Manager()
    user = UserManager()

    def get_date_dict(self):
        date_dict = defaultdict(list)
        photos = self.photos.order_by('exif_datetime_original').distinct('exif_datetime_original')

        for photo in photos:
            # remove duplicated month
            if not date_dict or not date_dict.get(photo.exif_datetime_original.year):
                date_dict[photo.exif_datetime_original.year].append(photo.exif_datetime_original)
            else:
                for date in date_dict.get(photo.exif_datetime_original.year):
                    if photo.exif_datetime_original.month == date.month:
                        break;
                    date_dict[photo.exif_datetime_original.year].append(photo.exif_datetime_original)

        return date_dict.items()

    def get_date(self, year, month):
        return "test111"

    def save(self, *args, **kwargs):
        super(User, self).save(*args, **kwargs)

    def __str__(self):
        return self.auth_user.username

