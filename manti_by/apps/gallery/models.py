from django.db import models
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.utils.translation import gettext_lazy as _
from taggit.managers import TaggableManager

from manti_by.apps.core.models import BaseModel
from manti_by.apps.core.utils import flush_cache, original_name


class ImageManager(models.Manager):
    def ordered(self):
        return self.get_queryset().order_by("-order")


class Image(BaseModel):
    original_image = models.ImageField(upload_to=original_name, blank=True, null=True, verbose_name=_("Image"))
    order = models.IntegerField(blank=True, default=0)
    tags = TaggableManager(blank=True)

    objects = ImageManager()

    class Meta:
        verbose_name = _("image")
        verbose_name_plural = _("images")

    def __str__(self):
        return f"Image #{self.id}"


@receiver(post_save, sender=Image, dispatch_uid="flush_gallery_cache")
def image_post_save(sender, instance, **kwargs):
    flush_cache(["index", "gallery"])
