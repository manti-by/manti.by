from __future__ import unicode_literals

from django.db import models
from django.urls import reverse
from django.utils.translation import ugettext_lazy as _
from django.utils.encoding import python_2_unicode_compatible
from django.db.models.signals import post_save
from django.dispatch import receiver

from PIL import Image as PILImage
from imagehash import phash
from taggit.managers import TaggableManager

from core.models import BaseModel
from core.mixins import SlugifyMixin, ImageMixin
from gallery.tasks import generate_thumbnails, generate_phash


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

    def generate_phash(self):
        image = PILImage.open(self.original_image)
        self.phash = phash(image)
        self.save()

    class Meta:
        verbose_name = _('Image')
        verbose_name_plural = _('Image List')


@receiver(post_save, sender=Image, dispatch_uid='generate_image_thumbnails')
def generate_image_thumbnails(sender, instance, **kwargs):
    if not instance.ready:
        generate_thumbnails.delay(instance.id)


@receiver(post_save, sender=Image, dispatch_uid='generate_image_phash')
def generate_image_phash(sender, instance, **kwargs):
    if not instance.phash:
        generate_phash.delay(instance.id)
