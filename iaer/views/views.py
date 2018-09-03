#!/usr/bin/env python
# -*- coding: utf-8 -*-

import time
import json
import pdb
import traceback

from django.http import HttpResponse
from django.utils import timezone
from rest_framework import status
from rest_framework.decorators import api_view

from iaer.constants import CODE_SUCCESS, FEEDBACK_FOOTER_IMAGE, DIR_FEEDBACK, MSG_NO_CONTENT, \
    MSG_GET_RED_ENVELOPES_SUCCESS, MSG_DELETE_RED_ENVELOPE_SUCCESS, CODE_NO_CONTENT, \
    MSG_204, MSG_ADD_RED_ENVELOPE_SUCCESS, MSG_ADD_IAER_SUCCESS, MSG_DELETE_IAER_SUCCESS, MSG_GET_IAERS_SUCCESS
from iaer.constants import MSG_SEND_FEEDBACK_SUCCESS
from iaer.models import User, RedEnvelope, Iaer
from iaer.serializers.iaer import IaerSerializer
from iaer.serializers.red_envelope import RedEnvelopeSerializer
from iaer.utils import invalid_token_response, get_user_by_token, save_error_log, \
        CustomModelViewSet, json_response, LargeResultsSetPagination
from iaer.utils import simple_json_response


def about_us_view(request):
    return HttpResponse(MSG_NO_CONTENT)


class RedEnvelopeViewSet(CustomModelViewSet):
    queryset = RedEnvelope.objects.all()
    serializer_class = RedEnvelopeSerializer
    pagination_class = LargeResultsSetPagination

    def list(self, request, *args, **kwargs):
        try:
            serializer = self.get_serializer(data=request.data)
            serializer.is_valid()
            token = request.query_params.get('token')
            user = get_user_by_token(token)
            if user:
                return json_response(super(RedEnvelopeViewSet, self).list(request, *args, **kwargs).data,
                                     CODE_SUCCESS, MSG_GET_RED_ENVELOPES_SUCCESS)
            else:
                return invalid_token_response()
        except Exception as e:
            return save_error_log(request, e)

    def get_queryset(self):
        token = self.request.query_params.get('token')
        user = get_user_by_token(token)
        user_id = self.request.query_params.get('user_id', -1)
        if int(user_id) < 0:
            return super(RedEnvelopeViewSet, self).get_queryset().order_by("-id")
        else:
            user_id = User.objects.get(user=user).id
            return super(RedEnvelopeViewSet, self).get_queryset().filter(user_id=user_id).order_by("-id")

    def create(self, request, *args, **kwargs):
        try:
            money_from = request.data.get('money_from')
            money = request.data.get('money')
            remark = request.data.get('remark')
            token = request.data.get('token')
            user = get_user_by_token(token)

            if user:
                red_envelope = RedEnvelope()
                red_envelope.user = User.objects.get(user=user)
                red_envelope.money = money
                red_envelope.money_from = money_from
                red_envelope.remark = remark
                red_envelope.created = timezone.now()
                red_envelope.save()
                response = RedEnvelopeSerializer(red_envelope).data
                return json_response(response, CODE_SUCCESS, MSG_ADD_RED_ENVELOPE_SUCCESS)
            else:
                return invalid_token_response()
        except Exception as e:
            return save_error_log(request, e)

    def destroy(self, request, *args, **kwargs):
        try:
            token = request.data.get('token')
            user = get_user_by_token(token)
            if user:
                red_envelope = self.get_object()
                if red_envelope:
                    try:
                        response = super(RedEnvelopeViewSet, self).destroy(request, *args, **kwargs)
                        if response.status_code != status.HTTP_204_NO_CONTENT:
                            red_envelope.id = -1
                    except Exception as e:
                        red_envelope.id = -1
                        save_error_log(request, e)
                    event_json = RedEnvelopeSerializer(red_envelope).data
                    return json_response(event_json, CODE_SUCCESS, MSG_DELETE_RED_ENVELOPE_SUCCESS)
                else:
                    return simple_json_response(CODE_NO_CONTENT, MSG_204)
            else:
                return invalid_token_response()
        except Exception as e:
            return save_error_log(request, e)


class IaerViewSet(CustomModelViewSet):
    queryset = Iaer.objects.all()
    serializer_class = IaerSerializer
    pagination_class = LargeResultsSetPagination

    def list(self, request, *args, **kwargs):
        try:
            serializer = self.get_serializer(data=request.data)
            serializer.is_valid()
            token = request.query_params.get('token')
            user = get_user_by_token(token)
            if user:
                return json_response(super(IaerViewSet, self).list(request, *args, **kwargs).data,
                                     CODE_SUCCESS, MSG_GET_IAERS_SUCCESS)
            else:
                return invalid_token_response()
        except Exception as e:
            return save_error_log(request, e)

    def get_queryset(self):
        token = self.request.query_params.get('token')
        user = get_user_by_token(token)
        user_id = self.request.query_params.get('user_id', -1)
        if int(user_id) < 0:
            return super(IaerViewSet, self).get_queryset().order_by("-id")
        else:
            user_id = User.objects.get(user=user).id
            return super(IaerViewSet, self).get_queryset().filter(user_id=user_id).order_by("-id")

    def create(self, request, *args, **kwargs):
        try:
            category = request.data.get('category')
            money = request.data.get('money')
            remark = request.data.get('remark')
            token = request.data.get('token')
            user = get_user_by_token(token)

            if user:
                iaer = Iaer()
                iaer.user = User.objects.get(user=user)
                iaer.money = money
                iaer.category = category
                iaer.remark = remark
                iaer.created = timezone.now()
                iaer.save()
                response = IaerSerializer(iaer).data
                return json_response(response, CODE_SUCCESS, MSG_ADD_IAER_SUCCESS)
            else:
                return invalid_token_response()
        except Exception as e:
            return save_error_log(request, e)

    def destroy(self, request, *args, **kwargs):
        try:
            token = request.data.get('token')
            user = get_user_by_token(token)
            if user:
                iaer = self.get_object()
                if iaer:
                    try:
                        response = super(IaerViewSet, self).destroy(request, *args, **kwargs)
                        if response.status_code != status.HTTP_204_NO_CONTENT:
                            iaer.id = -1
                    except Exception as e:
                       iaer.id = -1
                       save_error_log(request, e)
                    event_json = IaerSerializer(iaer).data
                    return json_response(event_json, CODE_SUCCESS, MSG_DELETE_IAER_SUCCESS)
                else:
                    return simple_json_response(CODE_NO_CONTENT, MSG_204)
            else:
                return invalid_token_response()
        except Exception as e:
            return save_error_log(request, e)

