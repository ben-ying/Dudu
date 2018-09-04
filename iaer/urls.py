from django.conf.urls import url
from rest_framework import renderers
from rest_framework.urlpatterns import format_suffix_patterns

from iaer.views.views import about_us_view, RedEnvelopeViewSet, IaerViewSet
from .views.user_views import UserViewSet, login_view, send_verify_code_view, reset_password_with_verify_code_view
from .views.user_views import api_root

user_list = UserViewSet.as_view({
    'get': 'list',
    'post': 'create'
})

user_detail = UserViewSet.as_view({
    'get': 'retrieve',
    'put': 'update',
    'patch': 'partial_update',
    'delete': 'destroy'
})

red_envelope_list = RedEnvelopeViewSet.as_view({
    'get': 'list',
    'post': 'create'
})

red_envelope_detail = RedEnvelopeViewSet.as_view({
    'get': 'retrieve',
    'delete': 'destroy'
})

iaer_list = IaerViewSet.as_view({
    'get': 'list',
    'post': 'create'
})

iaer_detail = IaerViewSet.as_view({
    'get': 'retrieve',
    'delete': 'destroy'
})

# user_login = LoginViewSet.as_view({
#     'post': 'retrieve',
# })

user_highlight = UserViewSet.as_view({
    'get': 'highlight'
}, renderer_classes=[renderers.StaticHTMLRenderer])

urlpatterns = [
    url(r'^$', api_root, name='index'),
    url(r'^users/$', user_list, name='user-list'),
    url(r'^users/(?P<pk>[0-9]+)/$', user_detail, name='user-detail'),
    url(r'^users/(?P<pk>[0-9]+)/highlight/$', user_highlight, name='user-highlight'),
    url(r'^user/login/$', login_view, name='user-login'),
    url(r'^user/send_verify_code/$', send_verify_code_view, name='send-verify-code'),
    url(r'^user/reset_password/$', reset_password_with_verify_code_view, name='reset-password-with-verify-code'),
    url(r'^about_us/$', about_us_view, name='about-us'),
    url(r'^envelopes/$', red_envelope_list, name='red-envelope-list'),
    url(r'^envelopes/(?P<pk>[0-9]+)/$', red_envelope_detail, name='red-envelope-detail'),
    url(r'^iaers/$', iaer_list, name='iaer-list'),
    url(r'^iaers/(?P<pk>[0-9]+)/$', iaer_detail, name='iaer-detail'),
]

urlpatterns = format_suffix_patterns(urlpatterns)
