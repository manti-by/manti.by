from .base import *  # noqa

ENVIRONMENT = "test"

SECRET_KEY = "151+9%r1l=uv&nub$s=%a3d3&2xzwoi=&v*!_gzn92car9uu*y"

DEBUG = False

TEMPLATE_DEBUG = False

COMPRESS_ENABLED = True
COMPRESS_ROOT = "/tmp/cache"

ALLOWED_HOSTS = ["127.0.0.1"]

BASE_URL = "http://127.0.0.1"

LOCALE_URLS = {"be": "127.0.0.1", "ru": "127.0.0.1", "en": "127.0.0.1"}

STATIC_URL = "/static/"
STATIC_ROOT = "/tmp/static"

MEDIA_URL = "/content/"
MEDIA_ROOT = "/tmp/content"

RQ_ASYNC = False

CACHES = {
    "default": {
        "BACKEND": "django.core.cache.backends.locmem.LocMemCache",
        "LOCATION": "manti_by",
    }
}

LOGGING = {
    "version": 1,
    "disable_existing_loggers": False,
    "formatters": {
        "simple": {
            "format": "%(asctime)s [%(levelname)s] %(message)s",
            "datefmt": "%H:%M:%S",
        }
    },
    "handlers": {
        "console": {"class": "logging.StreamHandler"},
    },
    "loggers": {
        "": {
            "handlers": ["console"],
            "level": "DEBUG",
            "propagate": True,
            "formatter": "simple",
        },
    },
}
