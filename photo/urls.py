from django.conf.urls import url
from django.urls import path
from django.conf.urls.static import static
from django.conf import settings

from .views import classification
from .views import index


app_name = 'photo'
urlpatterns = [
    path('classification', classification, name='classification'),
    path('', index, name='index'),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
