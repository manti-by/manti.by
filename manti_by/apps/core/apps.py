from django.apps import AppConfig
from django.utils.translation import gettext_lazy as _


class CoreConfig(AppConfig):
    default_auto_field = "django.db.models.BigAutoField"
    name = "manti_by.apps.core"

    verbose_name = _("Core")
    verbose_name_plural = _("Core")
