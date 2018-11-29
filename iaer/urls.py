from django.conf.urls import url
from django.urls import path
from django.urls import include
from rest_framework import renderers
from rest_framework.urlpatterns import format_suffix_patterns

# api
from iaer.views.views import about_us_view, RedEnvelopeViewSet, IaerViewSet, CategoryViewSet, FundViewSet
from iaer.views.user_views import UserViewSet, login_view, send_verify_code_view, reset_password_with_verify_code_view
from iaer.views.user_views import api_root
from iaer.views.statistics_views import StatisticsCategoryViewSet

# website
from iaer.views.webviews import index
from iaer.views.webviews import UserListView
from iaer.views.webviews import IaerListView
from iaer.views.webviews import IaerDeleteView
from iaer.views.webviews import IaerDetailView
from iaer.views.webviews import IaerCreateView


api_user_list = UserViewSet.as_view({
    'get': 'list',
    'post': 'create'
})

api_user_detail = UserViewSet.as_view({
    'get': 'retrieve',
    'put': 'update',
    'patch': 'partial_update',
    'delete': 'destroy'
})

api_red_envelope_list = RedEnvelopeViewSet.as_view({
    'get': 'list',
    'post': 'create'
})

api_red_envelope_detail = RedEnvelopeViewSet.as_view({
    'get': 'retrieve',
    'delete': 'destroy'
})

api_iaer_list = IaerViewSet.as_view({
    'get': 'list',
    'post': 'create'
})

api_iaer_detail = IaerViewSet.as_view({
    'get': 'retrieve',
    'delete': 'destroy'
})

api_category_list = CategoryViewSet.as_view({
    'get': 'list',
})

api_statistics_category = StatisticsCategoryViewSet.as_view({
    'get': 'list',
})

api_fund_list = FundViewSet.as_view({
    'get': 'list',
})

# user_login = LoginViewSet.as_view({
#     'post': 'retrieve',
# })

user_highlight = UserViewSet.as_view({
    'get': 'highlight'
}, renderer_classes=[renderers.StaticHTMLRenderer])

app_name = 'iaer'
api_urlpatterns = [
    path('', api_root, name='api-index'),
    path('users/', api_user_list, name='api-user-list'),
    path('users/<int:pk>/', api_user_detail, name='api-user-detail'),
    path('users/<int:pk>/highlight/', user_highlight, name='api-user-highlight'),
    path('user/login/', login_view, name='api-user-login'),
    path('user/send_verify_code/', send_verify_code_view, name='api-send-verify-code'),
    path('user/reset_password/', reset_password_with_verify_code_view, name='api-reset-password-with-verify-code'),
    path('about_us/', about_us_view, name='api-about-us'),
    path('envelopes/', api_red_envelope_list, name='api-red-envelope-list'),
    path('envelopes/<int:pk>/', api_red_envelope_detail, name='api-red-envelope-detail'),
    path('iaers/', api_iaer_list, name='api-iaer-list'),
    path('iaers/<int:pk>/', api_iaer_detail, name='api-iaer-detail'),
    path('categories/', api_category_list, name='api-category-list'),
    path('statistics/category/', api_statistics_category, name='api-statistics-category'),
    path('funds/', api_fund_list, name='api-fund-list'),
]

urlpatterns = [
    path('', index, name='index'),
    path('users/', UserListView.as_view(), name='users'),
    path('users/<int:pk>/', IaerListView.as_view(), name='iaer-list'),
    path('iaers/add', IaerCreateView.as_view(), name='iaer-add'),
    path('iaers/<int:pk>/', IaerDetailView.as_view(), name='iaer-detail'),
    path('iaers/delete/<int:pk>/', IaerDeleteView.as_view(), name='iaer-delete'),
    path('api/', include(api_urlpatterns)),
]

urlpatterns = format_suffix_patterns(urlpatterns)
