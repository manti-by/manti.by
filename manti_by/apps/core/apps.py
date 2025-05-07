from django.apps import AppConfig
from django.utils.translation import gettext_lazy as _


class CoreConfig(AppConfig):
    name = "manti_by.apps.core"
    verbose_name = _("core")
    verbose_name_plural = _("core")
