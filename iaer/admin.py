from django.contrib import admin

from .models import User
from .models import RedEnvelope
from .models import Iaer
from .models import Fund
from .models import Category
from .models import Setting


class UserAdmin(admin.ModelAdmin):
    list_display = ('id', 'auth_user', 'phone', 'get_username', 'zone', 'locale', 'profile', 'created', 'modified')
    search_fields = ('auth_user__username', 'phone')
admin.site.register(User, UserAdmin)


class RedEnvelopeAdmin(admin.ModelAdmin):
    list_display = ('id', 'user', 'money', 'money_type', 'money_from', 'remark', 'created')
    search_fields = ('user__auth_user__username', 'money', 'money_type', 'money_from', 'remark', 'created')
admin.site.register(RedEnvelope, RedEnvelopeAdmin)


class IaerAdmin(admin.ModelAdmin):
    list_display = ('id', 'user', 'money', 'category', 'date', 'datetime', 'remark', 'created')
    search_fields = ('user__auth_user__username', 'money', 'category', 'date', 'datetime', 'remark', 'created')
    fields = ('user', 'money', 'category', 'date', 'created', 'remark')
admin.site.register(Iaer, IaerAdmin)


class FundAdmin(admin.ModelAdmin):
    list_display = ('name', 'monthly_money', 'yearly_money', 'alternate_money', 'created', 'modified')
    search_fields = ('name',)
admin.site.register(Fund, FundAdmin)


class CategoryAdmin(admin.ModelAdmin):
    list_display = ('name', 'sequence', 'created', 'modified')
    search_fields = ('name',)
admin.site.register(Category, CategoryAdmin)

class SettingAdmin(admin.ModelAdmin):
    list_display = ('user_id', 'home_show_current', 'home_show_this_month', 'home_show_this_year')
    search_fields = ('user_id', 'home_show_current', 'home_show_this_month', 'home_show_this_year')
admin.site.register(Setting, SettingAdmin)
