from .settings_common import *

DEBUG = True

ALLOWED_HOSTS = ['mybackend.xyz', 'www.mybackend.xyz', '120.55.48.57', 'www.mybackend.online', 'mybackend.online']

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'myproject',
        'USER': 'root',
        'PASSWORD': '123456',
        'HOST': 'localhost',
        'PORT': '',
    },
}

SOURCE_PHOTO_FOLDER = '/root/Pictures'
