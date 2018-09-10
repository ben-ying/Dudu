from django.conf.urls import url
from django.urls import path
from django.urls import include
from rest_framework import renderers
from rest_framework.urlpatterns import format_suffix_patterns

# api
from iaer.views.views import about_us_view, RedEnvelopeViewSet, IaerViewSet
from .views.user_views import UserViewSet, login_view, send_verify_code_view, reset_password_with_verify_code_view
from .views.user_views import api_root

# website
from iaer.views.views import index
from iaer.views.views import iaer_list
from iaer.views.views import iaer_add
from iaer.views.views import iaer_detail



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

# user_login = LoginViewSet.as_view({
#     'post': 'retrieve',
# })

user_highlight = UserViewSet.as_view({
    'get': 'highlight'
}, renderer_classes=[renderers.StaticHTMLRenderer])

app_name = 'iaer'
api_urlpatterns = [
    path('', api_root, name='api-index'),
    path('users/', api_user_list, name='upi-ser-list'),
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
]

urlpatterns = [
    path('', index, name='index'),
    path('iaers/<int:user_id>/', iaer_list, name='iaer-list'),
    path('iaers/add', iaer_add, name='iaer-add'),
    path('iaers/<int:iaer_id>/', iaer_detail, name='iaer-detail'),
    path('api/', include(api_urlpatterns)),
]

urlpatterns = format_suffix_patterns(urlpatterns)
