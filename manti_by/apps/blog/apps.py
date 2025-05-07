from django.apps import AppConfig
from django.utils.translation import gettext_lazy as _


class BlogConfig(AppConfig):
    name = "manti_by.apps.blog"
    verbose_name = _("blog")
    verbose_name_plural = _("blogs")
