import uuid

from django.db import models
from django.conf import settings
from django.urls import reverse
from django.utils.translation import ugettext_lazy as _

from core.models import BaseModel


class Link(BaseModel):

    original_link = models.URLField(verbose_name=_('Original Link'))
    short_link = models.URLField(unique=True, null=True, blank=True,
                                 verbose_name=_('Short Link'))

    def __str__(self):
        return self.link

    @property
    def link(self):
        return '%s%s' % (
            settings.BASE_URL, reverse('shortener', args=[self.short_link])
        )

    def save(self, *args, **kwargs):
        existed = Link.objects.values_list('short_link', flat=True)
        short_link = uuid.uuid4().hex[:4]
        while short_link in existed:
            short_link = uuid.uuid4().hex[:4]
        self.short_link = short_link.lower()
        super(BaseModel, self).save(*args, **kwargs)
