import os

from django.conf.urls import url
from django.urls import path
from django.conf.urls.static import static
from django.conf import settings

from .views import classification
from .views import index
from .views import reset
from .views import UserListView
from .views import PhotoListView
from .views import PhotoYearArchiveView
from .views import PhotoMonthArchiveView
from .views import GalleryView

from myproject.settings import BASE_DIR


app_name = 'photo'
urlpatterns = [
    path('', index, name='index'),
    path('users/', UserListView.as_view(), name='users'),
    path('reset/<int:user_id>/', reset, name='reset'),
    path('classification/<int:user_id>/', classification, name='classification'),
    path('users/<int:pk>/', PhotoListView.as_view(), name='user-gallery'),
    path('users/<int:pk>/<int:year>/', PhotoYearArchiveView.as_view(), name='gallery-year-archive'),
    path('users/<int:pk>/<int:year>/<int:month>/', PhotoMonthArchiveView.as_view(month_format='%m'), name='gallery-month-archive'),
    path('galleries/<slug:title>/', GalleryView.as_view(), name='gallery'),
] + static(settings.MEDIA_URL, document_root=os.path.join(BASE_DIR, 'photo', 'media'))
