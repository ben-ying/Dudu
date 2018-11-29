# -*- coding: utf-8 -*-

import pdb

from django.db.models import Q

from iaer.utils import CustomModelViewSet, StandardResultsSetPagination, LargeResultsSetPagination, \
        json_response, get_user_by_token, save_error_log, invalid_token_response, simple_json_response
from iaer.models import Category, User, Iaer
from iaer.constants import CODE_SUCCESS, MSG_GET_CATEGORIES_SUCCESS
from iaer.serializers.category import CategorySerializer


class StaticsticsCategoryViewSet(CustomModelViewSet):
    queryset = Category.objects.all()
    serializer_class = CategorySerializer
    pagination_class = LargeResultsSetPagination

    def list(self, request, *args, **kwargs):
        response_data = super(StaticsticsCategoryViewSet, self).list(request, *args, **kwargs).data
        user_id = request.GET.get('user_id', 0)
        response_data['year'] = request.GET.get('year', 0) # if year = 0, get all category
        response_data['month'] = request.GET.get('month', 0) # if month = 0, get current year else get current month

        for result in response_data['results']:
            money = 0
            if response_data['year'] == 0:
                iaers = Iaer.objects.filter(Q(category = result['name']) & \
                        Q(user__id = user__id))
            elif response_data['month'] == 0:
                iaers = Iaer.objects.filter(Q(category = result['name']) & \
                        Q(user__id = user__id) & \
                        Q(created__year = response_data['year']))
            else:
                iaers = Iaer.objects.filter(Q(category = result['name']) & \
                        Q(user__id = user__id) & \
                        Q(created__year = response_data['year']) & \
                        Q(created__month = response_data['month']))

            for iaer in iaers:
                money += iaer.money
            result['money'] = money

        return json_response(response_data,
                         CODE_SUCCESS, MSG_GET_CATEGORIES_SUCCESS)


