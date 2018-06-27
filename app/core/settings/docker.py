from .base import *

SECRET_KEY = '9(+8&f)43k--m$cq1#kcwy$%o4hlj9remnlybh+-*gl6_*10*k'

DEBUG = False

COMPRESS_ENABLED = True

TEMPLATE_DEBUG = False

ALLOWED_HOSTS = ['127.0.0.1', 'local.manti.by',
                 'ru.local.manti.by', 'en.local.manti.by']

BASE_URL = 'http://local.manti.by'

STATIC_ROOT = '/srv/manti/static'
MEDIA_ROOT = '/srv/manti/content'

LOCALE_URLS = {
    'be': 'local.manti.by',
    'ru': 'ru.local.manti.by',
    'en': 'en.local.manti.by',
}


DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'manti',
        'USER': 'manti',
        'PASSWORD': 'pa55word',
        'HOST': 'manti-postgres',
        'PORT': '',
    }
}

CELERY_BROKER_URL = 'redis://manti-redis:6379/0'

CACHES = {
    'default': {
        'BACKEND': 'django.core.cache.backends.dummy.DummyCache',
    }
}

LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'handlers': {
        'file_app': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': '/var/log/manti/app.log',
        },
        'file_django': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': '/var/log/manti/django.log',
        },
        'console': {
            'level': 'DEBUG',
            'class': 'logging.StreamHandler',
        },
        'null': {
            'class': 'logging.NullHandler',
        },
    },
    'loggers': {
        'app': {
            'handlers': ['file_app', 'console'],
            'level': 'WARNING',
            'propagate': True,
            'formatter': 'verbose',
        },
        'django': {
            'handlers': ['file_django'],
            'level': 'WARNING',
            'propagate': True,
            'formatter': 'simple',
        },
        'django.template': {
            'handlers': ['null'],
        },
        'django.db.backends': {
            'handlers': ['null'],
        },
    },
}

DEFAULT_FROM_EMAIL = 'admin@manti.by'

INSTAGRAM_USER_ID = 'manti_by'
INSTAGRAM_CLIENT_ID = 'af64a4d7801544968ad3c5379d845e61'
INSTAGRAM_ACCESS_TOKEN = '192264889.af64a4d.921ede75e39f4f2ea43364934e52710e'
INSTAGRAM_CLIENT_SECRET = 'a091ae91942b43f79b3f49d6ec57c57a'
