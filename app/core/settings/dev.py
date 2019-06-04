import os

from .base import *


SECRET_KEY = "9(+8&f)43k--m$cq1#kcwy$%o4hlj9remnlybh+-*gl6_*10*k"

DEBUG = False

COMPRESS_ENABLED = True

TEMPLATE_DEBUG = False

ALLOWED_HOSTS = ["127.0.0.1", "localhost"]

BASE_URL = "http://127.0.0.1"

SESSION_COOKIE_DOMAIN = "127.0.0.1"

STATIC_URL = "/static/"
STATIC_ROOT = "/var/lib/manti.by/static"

MEDIA_URL = "/content/"
MEDIA_ROOT = "/var/lib/manti.by/content"

LOCALE_URLS = {"be": "127.0.0.1", "ru": "127.0.0.1", "en": "127.0.0.1"}

DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.postgresql_psycopg2",
        "NAME": "manti",
        "USER": "manti",
        "PASSWORD": "pa55word",
        "HOST": "manti-by-postgres",
        "PORT": "5432",
    }
}

THUMBNAIL_REDIS_HOST = "manti-by-redis"

CELERY_BROKER_URL = "redis://manti-by-redis:6379/0"

CACHES = {"default": {"BACKEND": "django.core.cache.backends.dummy.DummyCache"}}

LOGGING = {
    "version": 1,
    "disable_existing_loggers": False,
    "handlers": {
        "console": {"level": "DEBUG", "class": "logging.StreamHandler"},
        "null": {"class": "logging.NullHandler"},
    },
    "loggers": {
        "": {
            "handlers": ["console"],
            "level": "WARNING",
            "propagate": True,
            "formatter": "verbose",
        },
        "django": {
            "handlers": ["console"],
            "level": "WARNING",
            "propagate": True,
            "formatter": "simple",
        },
        "django.template": {"handlers": ["console"], "level": "DEBUG"},
    },
}

INSTAGRAM_CLIENT_ID = "af64a4d7801544968ad3c5379d845e61"
INSTAGRAM_ACCESS_TOKEN = "192264889.af64a4d.921ede75e39f4f2ea43364934e52710e"
INSTAGRAM_CLIENT_SECRET = "a091ae91942b43f79b3f49d6ec57c57a"

RAVEN_CONFIG[
    "dsn"
] = "https://004e19d0855247f08bbee0a321e087ba:a7d57b048f1249cab7d3ff6cc274823a@sentry.io/1274306"
