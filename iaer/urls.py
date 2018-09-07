from django.conf.urls import url
from django.urls import path
from django.urls import include
from rest_framework.urlpatterns import format_suffix_patterns

from iaer.views.views import iaer_list
from iaer.views.views import iaer_detail


urlpatterns = [
    path('iaers/', iaer_list, name='iaer-list'),
    path('iaers/<int:iaer_id>/', iaer_detail, name='iaer-detail'),
]

urlpatterns = format_suffix_patterns(urlpatterns)
