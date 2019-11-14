from .settings_common import *

DEBUG = True

ALLOWED_HOSTS = ['django.mybackend.xyz', 'mybackend.xyz', 'www.mybackend.xyz', 'localhost', '127.0.0.1', '192.168.1.201', '192.168.0.201', '192.168.0.200', '120.55.48.57']

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'myproject',
        'USER': 'pi',
        'PASSWORD': '123456',
        'HOST': 'localhost',
        'PORT': '',
    },
}

SOURCE_PHOTO_FOLDER = '/home/pi/Pictures'
