from .base import *  # noqa

os.environ.setdefault("DJANGO_RUNSERVER_HIDE_WARNING", "true")

from django.core.management.commands.runserver import Command as runserver
runserver.default_addr = "0.0.0.0"

DEBUG = True
TEMPLATE_DEBUG = False
COMPRESS_ENABLED = False

SECRET_KEY = "some_very_secret_ley"
ALLOWED_HOSTS = ("*",)

BASE_HOST = "0.0.0.0:8000"
BASE_URL = f"http://{BASE_HOST}"

SESSION_COOKIE_DOMAIN = None

STATIC_URL = "/static/"
STATIC_ROOT = "/mnt/data/manti/static"

MEDIA_URL = "/content/"
MEDIA_ROOT = "/mnt/data/manti/content"

LOCALE_URLS = {"by": BASE_HOST, "en": BASE_HOST}

CACHES = {"default": {"BACKEND": "django.core.cache.backends.dummy.DummyCache"}}

LOGGING = {
    "version": 1,
    "disable_existing_loggers": False,
    "handlers": {
        "console": {
            "level": "INFO",
            "class": "logging.StreamHandler",
        },
    },
    "loggers": {
        "": {
            "handlers": ["console"],
            "level": "INFO",
        },
    },
}
