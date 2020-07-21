#!/usr/bin/env python
# -*- coding: utf-8 -*- 
import json
import os
import random
import string
import oss2

from django.contrib.auth.models import User
from django.http import HttpResponse
from rest_framework import viewsets
from rest_framework.authtoken.models import Token
from rest_framework.pagination import PageNumberPagination

from .constants import CODE_SUCCESS


class CustomModelViewSet(viewsets.ModelViewSet):
    code = CODE_SUCCESS


def json_response(result, code=CODE_SUCCESS, message=''):
    response_data = dict()
    response_data['code'] = code
    response_data['message'] = str(message)
    response_data['result'] = result
    return HttpResponse(json.dumps(response_data), content_type="application/json")


def simple_json_response(code=CODE_SUCCESS, message=''):
    response_data = dict()
    response_data['code'] = code
    response_data['message'] = str(message)
    response_data['result'] = {}

    return HttpResponse(json.dumps(response_data), content_type="application/json")


def save_error_log(request, exception):
    view_name = request.resolver_match.view_name
    # todo
    #return simple_json_response(CODE_EXCEPTION, MSG_402)
    return simple_json_response(CODE_EXCEPTION, exception)


class LargeResultsSetPagination(PageNumberPagination):
    page_size = 1000
    page_size_query_param = 'page_size'
    max_page_size = 10000


class StandardResultsSetPagination(PageNumberPagination):
    page_size = 30
    page_size_query_param = 'page_size'
    max_page_size = 1000



