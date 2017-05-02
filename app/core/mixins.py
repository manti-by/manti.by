from unidecode import unidecode

import logging

from django.db import models
from django.conf import settings
from django.core.urlresolvers import reverse
from django.core.files.base import ContentFile
from django.template.defaultfilters import slugify
from django.utils.translation import ugettext_lazy as _

from core.utils import original_name, preview_name, thumb_name, gallery_name
from sorl.thumbnail import get_thumbnail

logger = logging.getLogger('app')

IMAGES_HELP_TEXT = _('You can select only base image, all others will be generated automatically')


class ImageMixin(models.Model):

    original_image = models.ImageField(upload_to=original_name, blank=True, null=True, verbose_name=_('Image'))

    thumbnail_image = models.ImageField(upload_to=thumb_name, blank=True, null=True, verbose_name=_('Thumbnail Image'))
    preview_image = models.ImageField(upload_to=preview_name, blank=True, null=True, verbose_name=_('Preview Image'))
    gallery_image = models.ImageField(upload_to=gallery_name, blank=True, null=True, verbose_name=_('Gallery Image'))

    thumbnail_ready = models.BooleanField(blank=True, default=False)
    preview_ready = models.BooleanField(blank=True, default=False)
    gallery_ready = models.BooleanField(blank=True, default=False)

    @property
    def ready(self):
        return self.thumbnail_ready \
           and self.preview_ready \
           and self.gallery_ready

    def generate_thumbnails(self):
        if not self.original_image:
            logger.error(_('Can\'t generate thumbnails, original image is not loaded'))

        if not self.thumbnail_image:
            resized = get_thumbnail(self.original_image, settings.THUMB_SIZE, crop='center', quality=65)
            self.thumbnail_image.save(resized.name, ContentFile(resized.read()), save=True)
            self.thumbnail_ready = True

        if not self.preview_image:
            resized = get_thumbnail(self.original_image, settings.PREVIEW_SIZE, quality=80)
            self.preview_image.save(resized.name, ContentFile(resized.read()), save=True)
            self.preview_ready = True

        if not self.gallery_image:
            resized = get_thumbnail(self.original_image, settings.GALLERY_SIZE, quality=100)
            self.gallery_image.save(resized.name, ContentFile(resized.read()), save=True)
            self.gallery_ready = True

        super(ImageMixin, self).save()

    class Meta:
        abstract = True


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
