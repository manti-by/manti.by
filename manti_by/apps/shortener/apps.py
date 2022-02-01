from django.apps import AppConfig
from django.utils.translation import gettext_lazy as _


class ShortenerConfig(AppConfig):
    default_auto_field = "django.db.models.BigAutoField"
    name = "manti_by.apps.shortener"

    verbose_name = _("Shortener")
    verbose_name_plural = _("Shortener List")
