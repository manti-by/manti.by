import os

from .base import *

DEBUG = False

COMPRESS_ENABLED = True

TEMPLATE_DEBUG = False

SECRET_KEY = '9(+8&f)43k--m$cq1#kcwy$%o4hlj9remnlybh+-*gl6_*10*k'

STATIC_ROOT = os.path.join(PROJECT_DIR, 'static')
MEDIA_ROOT = '/tmp/'

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'manti',
        'USER': 'manti',
        'PASSWORD': 'pa55word',
        'HOST': 'localhost',
        'PORT': '',
    }
}

CACHES = {
    'default': {
        'BACKEND': 'django.core.cache.backends.locmem.LocMemCache',
        'LOCATION': 'unique-snowflake',
    }
}

LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'formatters': {
        'simple': {
            'format': '%(asctime)s [%(levelname)s] %(message)s',
            'datefmt': '%H:%M:%S'
        }
    },
    'handlers': {
        'console': {
            'class': 'logging.StreamHandler',
        },
        'null': {
            'class': 'logging.NullHandler',
        },
    },
    'loggers': {
        'app': {
            'handlers': ['console'],
            'level': 'DEBUG',
            'propagate': True,
            'formatter': 'simple',
        },
        'django': {
            'handlers': ['console'],
            'level': 'DEBUG',
            'propagate': True,
            'formatter': 'simple',
        },
        'django.template': {
            'handlers': ['null'],
            'propagate': False,
            'level': 'ERROR',
        },
        'django.db.backends': {
            'handlers': ['null'],
            'propagate': False,
            'level': 'ERROR',
        },
    },
}
