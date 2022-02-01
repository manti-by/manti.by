from django.apps import AppConfig
from django.utils.translation import gettext_lazy as _


class ProfilesConfig(AppConfig):
    default_auto_field = "django.db.models.BigAutoField"
    name = "manti_by.apps.profiles"

    verbose_name = _("Profile")
    verbose_name_plural = _("Profiles")
