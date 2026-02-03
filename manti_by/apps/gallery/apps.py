from django.apps import AppConfig
from django.utils.translation import gettext_lazy as _


class GalleryConfig(AppConfig):
    name = "manti_by.apps.gallery"

    verbose_name = _("gallery")
    verbose_name_plural = _("galleries")
