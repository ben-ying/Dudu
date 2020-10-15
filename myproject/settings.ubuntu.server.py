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

EMAIL_USE_SSL = True
EMAIL_HOST = 'smtp.qq.com'  # 如果是 163 改成 smtp.163.com
EMAIL_PORT = 465
EMAIL_HOST_USER = '380668771@qq.com' # 邮箱
EMAIL_HOST_PASSWORD = 'fmlygmyommzpbijd'  # 授权码：https://service.mail.qq.com/cgi-bin/help?subtype=1&&id=28&&no=1001256
DEFAULT_FROM_EMAIL = EMAIL_HOST_USER
