from __future__ import unicode_literals

from django.db import models
from django.utils.translation import ugettext_lazy as _
from django.db.models.signals import post_save
from django.dispatch import receiver

from taggit.managers import TaggableManager

from core.models import BaseModel
from core.mixins import SlugifyMixin
from core.utils import release_name, cover_name
from blog.tasks import convert_to_mp3_preview, convert_to_ogg_preview, convert_to_ogg_release


class Post(SlugifyMixin, BaseModel, models.Model):

    title = models.CharField(max_length=255)

    meta = models.TextField()
    summary = models.TextField()
    description = models.TextField()

    release = models.FileField(max_length=255, null=True,
                               blank=True, upload_to=release_name,
                               verbose_name=_('Release File'))

    cover = models.ImageField(max_length=255, null=True,
                              blank=True, upload_to=cover_name,
                              verbose_name=_('Cover Image'))

    is_music = models.BooleanField(blank=True, default=False)
    catnum = models.CharField(max_length=16, blank=True)
    genre = models.CharField(max_length=32, blank=True)
    quality = models.CharField(max_length=255, blank=True)
    length = models.CharField(max_length=16, blank=True)
    tracklist = models.TextField(blank=True)

    tags = TaggableManager(blank=True)
    related = models.ManyToManyField('self', null=True, blank=True)

    mp3_preview_ready = models.BooleanField(blank=True, default=False)
    ogg_preview_ready = models.BooleanField(blank=True, default=False)
    ogg_release_ready = models.BooleanField(blank=True, default=False)

    def __str__(self):
        return self.title

    @property
    def ready(self):
        return self.mp3_preview_ready \
           and self.ogg_preview_ready \
           and self.ogg_release_ready


@receiver(post_save, sender=Post, dispatch_uid='convert_release')
def convert_release(sender, instance, **kwargs):
    if not instance.release:
        return
    if not instance.mp3_preview_ready:
        convert_to_mp3_preview.delay(instance.id)
    if not instance.ogg_preview_ready:
        convert_to_ogg_preview.delay(instance.id)
    if not instance.ogg_release_ready:
        convert_to_ogg_release.delay(instance.id)
