from django.db import models
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.urls import reverse
from django.utils.translation import gettext_lazy as _
from taggit.managers import TaggableManager

from manti_by.apps.core.mixins import SlugifyMixin
from manti_by.apps.core.models import BaseModel
from manti_by.apps.core.utils import flush_cache, original_name


class GalleryManager(models.Manager):
    def orderedordered(self):
        return self.get_queryset().order_by("-order")


class Gallery(SlugifyMixin, BaseModel):

    name = models.CharField(max_length=255)

    order = models.IntegerField(blank=True, default=0)
    tags = TaggableManager(blank=True)

    objects = GalleryManager()

    class Meta:
        verbose_name = _("Gallery")
        verbose_name_plural = _("Galleries")

    def __str__(self):
        return self.name

    def get_absolute_url(self):
        return reverse("gallery", args=[self.slug])

    @property
    def last_update(self):
        try:
            return self.images.order_by("-created")[0].created
        except Exception:
            return self.updated


class ImageManager(models.Manager):
    def ordered(self):
        return self.get_queryset().order_by("-order")


class Image(BaseModel):

    original_image = models.ImageField(upload_to=original_name, blank=True, null=True, verbose_name=_("Image"))
    gallery = models.ForeignKey(Gallery, null=True, blank=True, related_name="images", on_delete=models.CASCADE)

    phash = models.CharField(blank=True, max_length=255, null=True)
    order = models.IntegerField(blank=True, default=0)
    tags = TaggableManager(blank=True)

    objects = ImageManager()

    class Meta:
        verbose_name = _("Image")
        verbose_name_plural = _("Images")

    def __str__(self):
        return "Gallery #%s - Image#%d" % (self.gallery.name, self.id)


@receiver(post_save, sender=Image, dispatch_uid="flush_gallery_cache")
def image_post_save(sender, instance, **kwargs):
    flush_cache(["index", "gallery"])
