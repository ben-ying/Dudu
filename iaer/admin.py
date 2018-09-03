from django.contrib import admin

from .models import User, RedEnvelope, Iaer


class UserAdmin(admin.ModelAdmin):
    list_display = ('auth_user', 'phone', 'get_username', 'zone', 'locale', 'profile', 'created', 'modified')
    search_fields = ('auth_user', 'phone', 'get_username')
    #fields = ('email', 'get_username')

admin.site.register(User, UserAdmin)


class RedEnvelopeAdmin(admin.ModelAdmin):
    list_display = ('user', 'money', 'money_type', 'money_from', 'remark', 'created')
    search_fields = ('user', 'money', 'money_type', 'money_from', 'remark', 'created')
admin.site.register(RedEnvelope, RedEnvelopeAdmin)


class IaerAdmin(admin.ModelAdmin):
    list_display = ('user', 'money', 'category', 'datetime', 'remark', 'created')
    search_fields = ('user', 'money', 'category', 'datetime', 'remark', 'created')
    fields = ('user', 'money', 'category', 'remark')
admin.site.register(Iaer, IaerAdmin)
