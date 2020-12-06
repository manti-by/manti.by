from .base import *  # noqa: F401, F403

SECRET_KEY = "151+9%r1l=uv&nub$s=%a3d3&2xzwoi=&v*!_gzn92car9uu*y"

DEBUG = False

COMPRESS_ENABLED = True

TEMPLATE_DEBUG = False

ALLOWED_HOSTS = ["127.0.0.1"]

BASE_URL = "http://127.0.0.1"

LOCALE_URLS = {"be": "127.0.0.1", "ru": "127.0.0.1", "en": "127.0.0.1"}

STATIC_URL = "/static/"
STATIC_ROOT = "/var/lib/manti.by/static"

MEDIA_URL = "/content/"
MEDIA_ROOT = "/var/lib/manti.by/content"

DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.postgresql",
        "NAME": "manti_by",
        "USER": "manti_by",
        "PASSWORD": "manti_by",
        "HOST": "localhost",
        "PORT": "5432",
    }
}

CACHES = {
    "default": {
        "BACKEND": "django.core.cache.backends.locmem.LocMemCache",
        "LOCATION": "unique-snowflake",
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
