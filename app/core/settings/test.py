from .base import *

DEBUG = False

COMPRESS_ENABLED = True

TEMPLATE_DEBUG = False

SECRET_KEY = '9(+8&f)43k--m$cq1#kcwy$%o4hlj9remnlybh+-*gl6_*10*k'


CACHES = {
    'default': {
        'BACKEND': 'django.core.cache.backends.dummy.DummyCache',
    }
}

LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'formatters': {
        'verbose': {
            'format': '%(levelname)s|%(asctime)s|%(module)s|%(process)d|%(thread)d|%(message)s',
            'datefmt': "%d/%b/%Y %H:%M:%S"
        },
        'simple': {
            'format': '%(asctime)s [%(levelname)s] %(message)s',
            'datefmt': '%H:%M:%S'
        }
    },
    'handlers': {
        'file': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': 'app.log',
        },
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
            'formatter': 'verbose',
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
