import os

from django.conf.urls import url
from django.urls import path
from django.conf.urls.static import static
from django.conf import settings

from .views import classification
from .views import index
from .views import reset
from .views import UserListView
from .views import user_gallery

from myproject.settings import BASE_DIR


app_name = 'photo'
urlpatterns = [
    # todo remove after debug
    path('', index, name='index'),
    path('users/', UserListView.as_view(), name='users'),
    path('reset/<int:user_id>/', reset, name='reset'),
    path('classification/<int:user_id>/', classification, name='classification'),
    path('users/<int:user_id>/', user_gallery, name='user-gallery'),
] + static(settings.MEDIA_URL, document_root=os.path.join(BASE_DIR, 'photo', 'media'))
