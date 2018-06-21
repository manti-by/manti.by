from django.db import models
from django.urls import reverse
from django.utils.translation import ugettext_lazy as _
from django.db.models.signals import post_save
from django.dispatch import receiver

from PIL import Image as PILImage
from imagehash import phash
from taggit.managers import TaggableManager

from core.models import BaseModel
from core.mixins import SlugifyMixin
from core.utils import flush_cache, original_name
from gallery.tasks import generate_phash


class GalleryManager(models.Manager):

    def ordered(self):
        return self.get_queryset().order_by('-order')


class Gallery(SlugifyMixin, BaseModel):

    name = models.CharField(max_length=255)

    order = models.IntegerField(blank=True, default=0)
    tags = TaggableManager(blank=True)

    objects = GalleryManager()

    def __str__(self):
        return self.name

    def get_absolute_url(self):
        return reverse('gallery', args=[self.slug])

    @property
    def last_update(self):
        try:
            return self.images.order_by('-created')[0].created
        except Exception:
            return self.updated

    class Meta:
        verbose_name = _('Gallery')
        verbose_name_plural = _('Gallery List')


class ImageManager(models.Manager):

    def ordered(self):
        return self.get_queryset().order_by('-order')


class Image(BaseModel):

    original_image = models.ImageField(upload_to=original_name, blank=True, null=True, verbose_name=_('Image'))
    phash = models.CharField(blank=True, null=True, max_length=255)
    gallery = models.ForeignKey(Gallery, null=True, blank=True, related_name='images')

    order = models.IntegerField(blank=True, default=0)
    tags = TaggableManager(blank=True)

    objects = ImageManager()

    def __str__(self):
        return 'Gallery #%s - Image#%d' % (self.gallery.name, self.id)

    def generate_phash(self):
        image = PILImage.open(self.original_image)
        self.phash = phash(image)
        self.save()

    class Meta:
        verbose_name = _('Image')
        verbose_name_plural = _('Image List')


@receiver(post_save, sender=Image, dispatch_uid='generate_image_phash')
def generate_image_phash(sender, instance, **kwargs):
    if not instance.phash:
        generate_phash.delay(instance.id)
    flush_cache(['index', 'gallery'])
