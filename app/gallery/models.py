from __future__ import unicode_literals

from django.db import models
from django.urls import reverse
from django.utils.translation import ugettext_lazy as _
from django.utils.encoding import python_2_unicode_compatible

from PIL import Image as PILImage
from imagehash import phash
from taggit.managers import TaggableManager

from core.models import BaseModel
from core.mixins import SlugifyMixin, ImageMixin


@python_2_unicode_compatible
class Gallery(SlugifyMixin, BaseModel, models.Model):

    name = models.CharField(max_length=255)

    order = models.IntegerField(blank=True, default=0)
    tags = TaggableManager(blank=True)

    def __str__(self):
        return self.name

    def get_absolute_url(self):
        return reverse('gallery', args=[self.slug])

    class Meta:
        verbose_name = _('Gallery')
        verbose_name_plural = _('Gallery List')


@python_2_unicode_compatible
class Image(ImageMixin, BaseModel, models.Model):

    phash = models.CharField(blank=True, null=True, max_length=255)
    gallery = models.ForeignKey(Gallery, null=True, blank=True, related_name='images')

    order = models.IntegerField(blank=True, default=0)
    tags = TaggableManager(blank=True)

    def __str__(self):
        return 'Gallery #%s - Image#%d' % (self.gallery.name, self.id)

    def save(self, *args, **kwargs):
        image = PILImage.open(self.original_image)
        self.hash = phash(image)
        super(Image, self).save(*args, **kwargs)

    class Meta:
        verbose_name = _('Image')
        verbose_name_plural = _('Image List')

