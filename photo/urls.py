from django.conf.urls import url
from django.urls import path
from django.conf.urls.static import static
from django.conf import settings

from .views import classification
from .views import index
from .views import reset
from .views import child_gallery
from .views import user_gallery


app_name = 'photo'
urlpatterns = [
    # todo remove after debug
    path('reset', reset, name='classification'),
    path('classification', classification, name='classification'),
    # type 0
    url(r'^children/(?P<pk>[0-9]+)$', child_gallery, name='child-gallery'),
    # type 1
    url(r'^users/(?P<pk>[0-9]+)$', user_gallery, name='user-gallery'),
    # path('', index, name='index'),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
