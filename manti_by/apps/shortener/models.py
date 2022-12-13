import uuid

from django.conf import settings
from django.db import models
from django.urls import reverse
from django.utils.translation import gettext_lazy as _

from manti_by.apps.core.models import BaseModel


class Link(BaseModel):

    name = models.CharField(max_length=255, null=True, blank=True)
    original_link = models.URLField(verbose_name=_("Original Link"))
    short_link = models.URLField(unique=True, null=True, blank=True, verbose_name=_("Short Link"))

    class Meta:
        verbose_name = _("Link")
        verbose_name_plural = _("Links")

    def __str__(self):
        return self.link

    @property
    def link(self):
        return "{}{}".format(
            settings.BASE_URL,
            reverse("shortener", args=[self.short_link]),
        )

    def save(self, *args, **kwargs):
        existed = Link.objects.values_list("short_link", flat=True)
        short_link = uuid.uuid4().hex[:4].lower()
        while short_link in list(existed):
            short_link = uuid.uuid4().hex[:4].lower()
        self.short_link = short_link
        super(BaseModel, self).save(*args, **kwargs)
