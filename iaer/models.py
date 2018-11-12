# !/usr/bin/python
# coding:utf-8

from __future__ import unicode_literals

import os

from django.db import models
from django.db.models import TextField
from django.forms import IntegerField
from django.utils.functional import lazy

#from iaer.utils import upload_file


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


class CategoryManager(models.Manager):
    def category_choices(self):
        from django.db import connection
        cursor = connection.cursor()
        cursor.execute("""
            SELECT c.name, c.name
            FROM iaer_category c
            ORDER BY c.sequence ASC""")
        choice_list = cursor.fetchall()
        return choice_list


class Fund(models.Model):
    name = models.CharField(max_length=200)
    monthly_money = models.PositiveSmallIntegerField(default=0)
    yearly_money = models.PositiveIntegerField(default=0)
    alternate_money = models.PositiveIntegerField(default=0)
    created = models.DateField(editable=False, blank=True, null=True)
    modified = models.DateField(auto_now=True, blank=True, null=True)
    
    def __str__(self):
        return self.name


class User(models.Model):
    auth_user = models.OneToOneField('auth.User', related_name='uss', on_delete=models.CASCADE)
    is_master_user = models.BooleanField(default=False)
    slave_user = models.ManyToManyField('self', blank=True)
    fund = models.ForeignKey(Fund, on_delete=models.CASCADE)
    phone = models.CharField(max_length=30, blank=True, null=True)
    gender = models.PositiveSmallIntegerField(default=2) #0 for boy, 1 for girl, 2 for others
    profile = models.CharField(max_length=200, blank=True, null=True)
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

    def get_username(self):
        return self.auth_user.username

    def save(self, *args, **kwargs):
        super(User, self).save(*args, **kwargs)

    def __str__(self):
        return self.auth_user.username


class Category(models.Model):
    name = models.CharField(max_length=30)
    sequence = models.PositiveSmallIntegerField(default=0)
    created = models.DateField(editable=False, blank=True, null=True)
    modified = models.DateField(auto_now=True, blank=True, null=True)

    objects = CategoryManager()


class RedEnvelope(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    money = models.CharField(max_length=10, blank=True, null=True)
    money_type = models.IntegerField(default=0) # 0 for rmb, 1 for dollar
    money_from = models.CharField(max_length=100, blank=True, null=True)
    remark = models.CharField(max_length=100)
    created = models.DateTimeField(editable=False, blank=True, null=True)


class Iaer(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    money = models.IntegerField()
    category = models.CharField(max_length=30, choices = Category.objects.category_choices(), default=0)
    money_type = models.IntegerField(default=0)  # 0 for rmb, 1 for dollar
    remark = models.CharField(max_length=100)
    created = models.DateTimeField(editable=False, blank=True, null=True)
    type = models.IntegerField(default=0)
    chart_type = models.IntegerField(default=0)
    format = models.CharField(max_length=50, blank=True, null=True)
    datetime = models.DateTimeField(auto_now=True, blank=True, null=True)
    description = TextField(blank=True, null=True)
    timing = models.CharField(max_length=100, blank=True, null=True) # for every week or every month input or consumption

    class Meta:
        ordering = ['-id',]


class Verify(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    email_verify_code = models.CharField(max_length=10, blank=True, null=True)
    phone_verify_code = models.CharField(max_length=10, blank=True, null=True)
    created = models.DateTimeField(auto_now=True, blank=True, null=True)

    def __str__(self):
        return self.user.get_username()
