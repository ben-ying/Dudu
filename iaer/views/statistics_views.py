# -*- coding: utf-8 -*-

import pdb

from django.db.models import Q
from datetime import datetime
from django.http import HttpResponse
from collections import OrderedDict

from iaer.utils import CustomModelViewSet, StandardResultsSetPagination, LargeResultsSetPagination, \
        json_response, get_user_by_token, save_error_log, invalid_token_response, simple_json_response
from iaer.models import Category, User, Iaer
from iaer.constants import CODE_SUCCESS, MSG_GET_CATEGORIES_SUCCESS
from iaer.serializers.category import CategorySerializer
from iaer.serializers.iaer import IaerSerializer


class StatisticsCategoryViewSet(CustomModelViewSet):
    queryset = Category.objects.all()
    serializer_class = CategorySerializer
    pagination_class = LargeResultsSetPagination

    def list(self, request, *args, **kwargs):
        response_data = super(StatisticsCategoryViewSet, self).list(request, *args, **kwargs).data
        token = request.GET.get('token', '')
        user = get_user_by_token(token)
        response_data['year'] = int(request.GET.get('year', 0)) # if year = 0, get all category
        response_data['month'] = int(request.GET.get('month', 0)) # if month = 0, get current year else get current month

        for result in response_data['results']:
            money = 0
            if response_data['year'] == 0:
                iaers = Iaer.objects.filter(Q(category = result['name']) & \
                        Q(user__id = user.id))
            elif response_data['month'] == 0:
                iaers = Iaer.objects.filter(Q(category = result['name']) & \
                        Q(user__id = user.id) & \
                        Q(created__year = response_data['year']))
            else:
                iaers = Iaer.objects.filter(Q(category = result['name']) & \
                        Q(user__id = user.id) & \
                        Q(created__year = response_data['year']) & \
                        Q(created__month = response_data['month']))

            for iaer in iaers:
                money += iaer.money
            result['money'] = money

        return json_response(response_data,
                         CODE_SUCCESS, MSG_GET_CATEGORIES_SUCCESS)


class StatisticsDateViewSet(CustomModelViewSet):
    queryset = Iaer.objects.filter(user__id = -1)
    serializer_class = IaerSerializer
    pagination_class = LargeResultsSetPagination

    def list(self, request, *args, **kwargs):
        response_data = super(StatisticsDateViewSet, self).list(request, *args, **kwargs).data
        token = request.GET.get('token', '')
        user = get_user_by_token(token)
        request_type = int(self.request.GET.get('type', 1)) # 1 for monthly, 2 for yearly
        data_list = []
        year = datetime.now().year
        month = datetime.now().month

        if user:
            iaers = Iaer.objects.filter(user__id = user.id).order_by('created')
        else:
            iaers = Iaer.objects.filter(user__id = -1)


        if request_type == 1:
            for y in range(2017, year + 1): # get data from year 2017
                for m in range(1, 12 + 1):
                    iaer_list = iaers.filter(Q(created__year = y) & Q(created__month = m))
                    if len(iaer_list) > 0:
                        in_money = 0
                        out_money = 0
                        for iaer in iaer_list:
                            if iaer.money > 0:
                                in_money += iaer.money
                            else:
                                out_money += iaer.money
                        if in_money != 0:
                            data = OrderedDict([('year', y), ('month', m), ('money', in_money)])
                            data_list.append(data)
                        if out_money != 0:
                            data = OrderedDict([('year', y), ('month', m), ('money', out_money)])
                            data_list.append(data)
        else: 
            for y in range(2017, year + 1): # get data from year 2017
                iaer_list = iaers.filter(created__year = y)
                if len(iaer_list) > 0:
                    in_money = 0
                    out_money = 0
                    for iaer in iaer_list:
                        if iaer.money > 0:
                            in_money += iaer.money
                        else:
                            out_money += iaer.money
                    if in_money != 0:
                        data = OrderedDict([('year', y), ('month', 0), ('money', in_money)])
                        data_list.append(data)
                    if out_money != 0:
                        data = OrderedDict([('year', y), ('month', 0), ('money', out_money)])
                        data_list.append(data)


        response_data['results'] = data_list
        response_data['count'] = len(data_list)

        return json_response(response_data, CODE_SUCCESS, MSG_GET_CATEGORIES_SUCCESS)
