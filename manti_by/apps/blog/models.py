from django.db import models
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.template.loader import render_to_string
from django.urls import reverse
from django.utils.translation import gettext_lazy as _
from taggit.managers import TaggableManager
from taggit.models import TaggedItemBase

from manti_by.apps.blog.constants import TRANSLATED_FIELDS
from manti_by.apps.core.mixins import SlugifyMixin
from manti_by.apps.core.models import BaseModel
from manti_by.apps.core.utils import cover_name, flush_cache, release_name


class GenresProxy(TaggedItemBase):
    content_object = models.ForeignKey("Post", on_delete=models.CASCADE)


class TagsProxy(TaggedItemBase):
    content_object = models.ForeignKey("Post", on_delete=models.CASCADE)


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

    genre = TaggableManager(
        blank=True,
        through=GenresProxy,
        verbose_name=_("Genre"),
        related_name="post_genres",
    )
    tags = TaggableManager(blank=True, through=TagsProxy, verbose_name=_("Tags"), related_name="post_tags")

    viewed = models.IntegerField(blank=True, default=0)
    related = models.ManyToManyField("self", blank=True)

    mp3_preview_ready = models.BooleanField(blank=True, default=False)
    mp3_release_ready = models.BooleanField(blank=True, default=False)
    ogg_preview_ready = models.BooleanField(blank=True, default=False)
    ogg_release_ready = models.BooleanField(blank=True, default=False)

    objects = PostManager()

    class Meta:
        verbose_name = _("Post")
        verbose_name_plural = _("Posts")

    def __str__(self):
        return self.name

    @property
    def files_converted(self):
        return self.mp3_preview_ready and self.mp3_release_ready and self.ogg_preview_ready and self.ogg_release_ready

    @property
    def translations_filled(self) -> bool:
        for field in TRANSLATED_FIELDS:
            if not getattr(self, field):
                return False
        return True

    @property
    def url(self) -> str:
        return reverse("post", kwargs={"slug": self.slug})

    @property
    def release_file_url(self) -> str | None:
        try:
            ext = self.release.url.split(".")[-1]
            return self.release.url.replace(f".{ext}", "")
        except (IndexError, AttributeError, ValueError):
            return

    @property
    def release_file_name(self) -> str | None:
        try:
            ext = self.release.file.name.split(".")[-1]
            return self.release.file.name.replace(f".{ext}", "")
        except (IndexError, AttributeError, ValueError):
            return

    @property
    def preview_file_url(self) -> str | None:
        try:
            return self.release_file_url.replace("release", "preview")
        except (IndexError, AttributeError, ValueError):
            return

    @property
    def preview_file_name(self) -> str | None:
        try:
            return self.release_file_name.replace("release", "preview")
        except (IndexError, AttributeError, ValueError):
            return

    @property
    def release_mp3_url(self) -> str | None:
        return f"{self.release_file_url}.mp3" if self.release_file_url else None

    @property
    def release_mp3_file(self) -> str | None:
        return f"{self.release_file_name}.mp3" if self.release_file_name else None

    @property
    def preview_mp3_url(self) -> str | None:
        return f"{self.preview_file_url}.mp3" if self.preview_file_url else None

    @property
    def preview_mp3_file(self) -> str | None:
        return f"{self.preview_file_name}.mp3" if self.preview_file_name else None

    @property
    def release_ogg_url(self) -> str | None:
        return f"{self.release_file_url}.ogg" if self.release_file_url else None

    @property
    def release_ogg_file(self) -> str | None:
        return f"{self.release_file_name}.ogg" if self.release_file_name else None

    @property
    def preview_ogg_url(self) -> str | None:
        return f"{self.preview_file_url}.ogg" if self.preview_file_url else None

    @property
    def preview_ogg_file(self) -> str | None:
        return f"{self.preview_file_name}.ogg" if self.preview_file_name else None

    @property
    def genres(self) -> str:
        return ", ".join(self.genre.values_list("name", flat=True))

    @property
    def title(self) -> str:
        return f"{self.name} /{self.genres}/"

    @property
    def most_common_tags(self) -> list[TagsProxy]:
        return [tag for tag in self.tags.exclude(slug="front") if TagsProxy.objects.filter(tag_id=tag.id).count() > 1]

    def as_dict(self) -> dict:
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


@receiver(post_save, sender=Post, dispatch_uid="flush_caches")
def blog_post_save(sender, instance, **kwargs):
    flush_cache(["index", "blog", "post-%s" % instance.slug])
