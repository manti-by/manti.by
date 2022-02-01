from django.apps import AppConfig
from django.utils.translation import gettext_lazy as _


class BlogConfig(AppConfig):
    default_auto_field = "django.db.models.BigAutoField"
    name = "manti_by.apps.blog"

    verbose_name = _("Blog")
    verbose_name_plural = _("Blogs")
