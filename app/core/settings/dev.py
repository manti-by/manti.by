from .base import *


# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True


# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '9(+8&f)43k--m$cq1#kcwy$%o4hlj9remnlybh+-*gl6_*10*k'


# Database
# https://docs.djangoproject.com/en/1.10/ref/settings/#databases
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'core',
        'USER': 'core',
        'PASSWORD': 'pa55word',
        'HOST': 'localhost',
        'PORT': '',
    }
}


# Logging
# https://docs.djangoproject.com/en/1.10/ref/settings/#logging
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


try:
    from .local import *
except ImportError:
    pass
