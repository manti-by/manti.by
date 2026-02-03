from .base import *  # noqa

SECRET_KEY = "some-very-secret-ley"

DEBUG = False

TEMPLATE_DEBUG = False

BASE_URL = "http://127.0.0.1"

LOCALE_URLS = {"by": "127.0.0.1", "en": "127.0.0.1"}

STATIC_URL = "/static/"
STATIC_ROOT = "/tmp/static"

MEDIA_URL = "/content/"
MEDIA_ROOT = "/tmp/content"

CACHES = {
    "default": {
        "BACKEND": "django.core.cache.backends.locmem.LocMemCache",
        "LOCATION": "manti_by",
    }
}
