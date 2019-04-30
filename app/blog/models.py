from django.db import models
from django.urls import reverse
from django.utils.translation import ugettext_lazy as _
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.template.loader import render_to_string

from taggit.models import TaggedItemBase
from taggit.managers import TaggableManager

from core.models import BaseModel
from core.mixins import SlugifyMixin
from core.utils import flush_cache, release_name, cover_name
from blog.utils import generate_preview_for_post


class GenresProxy(TaggedItemBase):
    content_object = models.ForeignKey("Post")


class TagsProxy(TaggedItemBase):
    content_object = models.ForeignKey("Post")


class PostManager(models.Manager):
    def ordered(self):
        return self.get_queryset().order_by("-created")


class Post(SlugifyMixin, BaseModel):

    name = models.CharField(max_length=255)

    meta = models.TextField()
    summary = models.TextField()
    description = models.TextField()

    release = models.FileField(
        max_length=255,
        null=True,
        blank=True,
        upload_to=release_name,
        verbose_name=_("Release File"),
    )

    cover = models.ImageField(
        max_length=255,
        null=True,
        blank=True,
        upload_to=cover_name,
        verbose_name=_("Cover Image"),
    )

    is_music = models.BooleanField(blank=True, default=False)
    catnum = models.CharField(max_length=16, blank=True)
    quality = models.CharField(max_length=255, blank=True)
    length = models.CharField(max_length=16, blank=True)
    tracklist = models.TextField(blank=True)

    genre = TaggableManager(blank=True, through=GenresProxy, verbose_name=_("Genre"))
    genre.rel.related_name = "post_genres"

    tags = TaggableManager(blank=True, through=TagsProxy, verbose_name=_("Tags"))
    tags.rel.related_name = "post_tags"

    viewed = models.IntegerField(blank=True, default=0)
    related = models.ManyToManyField("self", blank=True)

    mp3_preview_ready = models.BooleanField(blank=True, default=False)
    ogg_preview_ready = models.BooleanField(blank=True, default=False)
    ogg_release_ready = models.BooleanField(blank=True, default=False)

    original_id = models.IntegerField(blank=True, default=0)  # Temporary field

    objects = PostManager()

    def __str__(self):
        return self.name

    @property
    def files_converted(self):
        return (
            self.mp3_preview_ready and self.ogg_preview_ready and self.ogg_release_ready
        )

    @property
    def translations_filled(self):
        for field in (
            "name_be",
            "name_ru",
            "name_en",
            "meta_be",
            "meta_ru",
            "meta_en",
            "summary_be",
            "summary_ru",
            "summary_en",
            "description_be",
            "description_ru",
            "description_en",
        ):
            if not getattr(self, field):
                return False
        return True

    @property
    def url(self):
        return reverse("post", kwargs={"slug": self.slug})

    @property
    def release_mp3_url(self):
        return self.release.url if self.release else None

    @property
    def release_mp3_file(self):
        return self.release.file.name if self.release else None

    @property
    def preview_mp3_url(self):
        return self.release.url.replace("release", "preview") if self.release else None

    @property
    def preview_mp3_file(self):
        return (
            self.release.file.name.replace("release", "preview")
            if self.release
            else None
        )

    @property
    def release_ogg_url(self):
        return self.release.url.replace("mp3", "ogg") if self.release else None

    @property
    def release_ogg_file(self):
        return self.release.file.name.replace("mp3", "ogg") if self.release else None

    @property
    def preview_ogg_url(self):
        return (
            self.release.url.replace("release", "preview").replace("mp3", "ogg")
            if self.release
            else None
        )

    @property
    def preview_ogg_file(self):
        return (
            self.release.file.name.replace("release", "preview").replace("mp3", "ogg")
            if self.release
            else None
        )

    @property
    def title(self):
        return "%s /%s/" % (
            self.name,
            ", ".join(self.genre.values_list("name", flat=True)),
        )

    @property
    def most_common_tags(self):
        for tag in self.tags.exclude(slug="front"):
            if TagsProxy.objects.filter(tag_id=tag.id).count() > 1:
                yield tag

    def as_dict(self):
        return {
            "id": self.id,
            "url": self.url,
            "name": self.name,
            "title": self.title,
            "cover": self.cover.url if self.cover else None,
            "release": {"mp3": self.release_mp3_url, "ogg": self.release_ogg_url},
            "preview": {"mp3": self.preview_mp3_url, "ogg": self.preview_ogg_url},
        }

    def as_html(self, context):
        return render_to_string("blog/list-item.html", {"item": self, **context})


@receiver(post_save, sender=Post, dispatch_uid="convert_release")
def convert_release(sender, instance, **kwargs):
    generate_preview_for_post(instance)
    flush_cache(["index", "blog", "post-%s" % instance.slug])
