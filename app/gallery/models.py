from __future__ import unicode_literals

from django.db import models

from core.models import BaseModel
from core.mixins import SlugifyMixin, ImageMixin


class Gallery(SlugifyMixin, BaseModel, models.Model):

    name = models.CharField(max_length=255)
    order = models.IntegerField(blank=True, default=0)

    def __str__(self):
        return self.name


class Image(ImageMixin, BaseModel, models.Model):

    gallery = models.ForeignKey(Gallery, null=True, blank=True, related_name='images')
    order = models.IntegerField(blank=True, default=0)

    def __str__(self):
        return '%s - Image#%d' % (self.gallery.name, self.id)

