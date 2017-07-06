from __future__ import unicode_literals

from django.db import models
from django.urls import reverse
from django.utils.translation import ugettext_lazy as _
from django.utils.encoding import python_2_unicode_compatible
from django.db.models.signals import post_save
from django.dispatch import receiver

from taggit.models import TaggedItemBase
from taggit.managers import TaggableManager

from core.models import BaseModel
from core.mixins import SlugifyMixin
from core.utils import release_name, cover_name
from blog.tasks import convert_to_mp3_preview, convert_to_ogg_preview, convert_to_ogg_release


class GenresProxy(TaggedItemBase):
    content_object = models.ForeignKey('Post')


class TagsProxy(TaggedItemBase):
    content_object = models.ForeignKey('Post')


class PostManager(models.Manager):

    def ordered(self):
        return self.get_queryset().order_by('-created')


@python_2_unicode_compatible
class Post(SlugifyMixin, BaseModel, models.Model):

    name = models.CharField(max_length=255)

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
    quality = models.CharField(max_length=255, blank=True)
    length = models.CharField(max_length=16, blank=True)
    tracklist = models.TextField(blank=True)

    genre = TaggableManager(blank=True, through=GenresProxy)
    genre.rel.related_name = '+'

    tags = TaggableManager(blank=True, through=TagsProxy)
    tags.rel.related_name = '+'

    viewed = models.IntegerField(blank=True, default=0)
    related = models.ManyToManyField('self', blank=True)

    mp3_preview_ready = models.BooleanField(blank=True, default=False)
    ogg_preview_ready = models.BooleanField(blank=True, default=False)
    ogg_release_ready = models.BooleanField(blank=True, default=False)

    original_id = models.IntegerField(blank=True, default=0)  # Temporary field

    objects = PostManager()

    def __str__(self):
        return self.name

    @property
    def ready(self):
        return self.mp3_preview_ready \
           and self.ogg_preview_ready \
           and self.ogg_release_ready

    @property
    def url(self):
        return reverse('post', kwargs={'slug': self.slug})

    @property
    def release_mp3_url(self):
        return self.release.url

    @property
    def preview_mp3_url(self):
        return self.release.url.replace('release', 'preview')

    @property
    def release_ogg_url(self):
        return self.release.url.replace('mp3', 'ogg')

    @property
    def preview_ogg_url(self):
        return self.release.url.replace('release', 'preview').replace('mp3', 'ogg')

    @property
    def title(self):
        return '%s /%s/' % (self.name, ', '.join(self.genre.values_list('name', flat=True)))

    def as_dict(self):
        return {
            'id': self.id,
            'url': self.url,
            'name': self.name,
            'title': self.title,
            'cover': self.cover.url,
            'release': {
                'mp3': self.release_mp3_url,
                'ogg': self.release_ogg_url
            },
            'preview': {
                'mp3': self.preview_mp3_url,
                'ogg': self.preview_ogg_url
            },
        }


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
