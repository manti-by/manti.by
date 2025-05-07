from django.db import models
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.utils.translation import gettext_lazy as _

from manti_by.apps.core.models import BaseModel
from manti_by.apps.core.utils import flush_cache, images_path


class Tags(models.Model):
    tag = models.ForeignKey("core.Tag", related_name="tags_tag_items", on_delete=models.CASCADE)
    image = models.ForeignKey("gallery.Image", related_name="tags_image_items", on_delete=models.CASCADE)

    def __str__(self):
        return f"Tag #{self.tag} for image #{self.post.id}"


class ImageManager(models.Manager):
    def ordered(self):
        return self.get_queryset().order_by("-order")


class Image(BaseModel):
    original_image = models.ImageField(upload_to=images_path, blank=True, null=True, verbose_name=_("Image"))
    order = models.IntegerField(blank=True, default=0)
    tags = models.ManyToManyField(
        to="core.Tag",
        through=Tags,
        verbose_name=_("Tags"),
        related_name="tags",
        blank=True,
    )

    objects = ImageManager()

    class Meta:
        verbose_name = _("image")
        verbose_name_plural = _("images")

    def __str__(self):
        return f"Image #{self.pk}"


@receiver(post_save, sender=Image, dispatch_uid="flush_gallery_cache")
def image_post_save(sender: str, instance: Image, **kwargs: dict) -> None:
    flush_cache(["index", "gallery"])
