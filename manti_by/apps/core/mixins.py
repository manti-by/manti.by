import logging

from django.db import models
from django.template.defaultfilters import slugify
from django.urls import reverse
from django.utils.translation import gettext_lazy as _

logger = logging.getLogger(__name__)


class SlugifyMixin(models.Model):

    slug = models.SlugField(null=True, blank=True, unique=True, verbose_name=_("Slug"))

    def get_absolute_url(self):
        return reverse(self.__class__.__name__.lower(), args=[str(self.slug)])

    def save(self, *args, **kwargs):
        if self.slug is None:
            self.slug = slugify(self.name)
        super().save(*args, **kwargs)

    class Meta:
        abstract = True
