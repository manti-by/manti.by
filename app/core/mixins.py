import logging

from unidecode import unidecode

from django.db import models
from django.core.urlresolvers import reverse
from django.template.defaultfilters import slugify
from django.utils.translation import ugettext_lazy as _

logger = logging.getLogger()


class SlugifyMixin(models.Model):

    slug = models.SlugField(null=True, blank=True, unique=True, verbose_name=_('Slug'))

    def get_absolute_url(self):
        return reverse(self.__class__.__name__.lower(), args=[str(self.slug)])

    def save(self, *args, **kwargs):
        if hasattr(self, 'name') and self.slug is None:
            self.slug = unidecode(self.name)
        else:
            self.slug = unidecode(self.slug)
        self.slug = slugify(self.slug)
        super(SlugifyMixin, self).save(*args, **kwargs)

    class Meta:
        abstract = True
