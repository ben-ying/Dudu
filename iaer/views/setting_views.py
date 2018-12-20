# -*- coding: utf-8 -*-

import pdb

from django.utils import timezone

from iaer.constants import CODE_SUCCESS, MSG_INVALID_PASSWORD, MSG_GET_SETTING_SUCCESS
from iaer.utils import json_response, invalid_token_response, get_user_by_token, \
    CustomModelViewSet, save_error_log
from iaer.serializers.setting import SettingSerializer
from iaer.models import Setting
from iaer.models import User


class SettingViewSet(CustomModelViewSet):
    serializer_class = SettingSerializer

    def retrieve(self, request, *args, **kwargs):
        token = request.query_params.get('token')
        try:
            auth_user = get_user_by_token(token)
            if auth_user:
                user = User.objects.get(auth_user = auth_user)
                if Setting.objects.filter(user_id = user.id):
                    setting = Setting.objects.get(user_id = user.id)
                else:
                    setting = Setting()
                    setting.created = timezone.now()
                setting.user = user
                setting.save()
                return json_response(SettingSerializer(setting).data, CODE_SUCCESS, MSG_GET_SETTING_SUCCESS)
            else:
                return invalid_token_response()
        except Exception as e:
            return save_error_log(request, e)

    def update(self, request, *args, **kwargs):
        token = request.data.get('token')
        home_show_current = request.data.get('home_show_current', False)
        home_show_this_month = request.data.get('home_show_this_month', False)
        home_show_this_year = request.data.get('home_show_this_year', False)

        try:
            auth_user = get_user_by_token(token)
            if auth_user:
                user = User.objects.get(auth_user = auth_user)
                if Setting.objects.filter(user_id = user.id):
                    setting = Setting.objects.get(user_id = user.id)
                else:
                    setting = Setting()

                setting.home_show_current = home_show_current
                setting.home_show_this_month = home_show_this_month
                setting.home_show_this_year = home_show_this_year
                setting.user = user
                setting.save()

                return json_response(SettingSerializer(setting).data, CODE_SUCCESS, MSG_UPDATE_SETTING_SUCCESS)
            else:
                return invalid_token_response()
        except Exception as e:
            return save_error_log(request, e)
