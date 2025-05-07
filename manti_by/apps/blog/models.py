from django.db import models
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.template.loader import render_to_string
from django.urls import reverse
from django.utils.text import slugify
from django.utils.translation import gettext_lazy as _

from sorl.thumbnail import get_thumbnail

from manti_by.apps.core.models import BaseModel
from manti_by.apps.core.utils import cover_path, flush_cache, release_path


class Genres(models.Model):
    tag = models.ForeignKey("core.Tag", related_name="post_to_genre_tags", on_delete=models.CASCADE)
    post = models.ForeignKey("blog.Post", related_name="post_to_genre_posts", on_delete=models.CASCADE)

    def __str__(self):
        return f"Genre #{self.tag} for post #{self.post.id}"


class Tags(models.Model):
    tag = models.ForeignKey("core.Tag", related_name="post_to_tag_tags", on_delete=models.CASCADE)
    post = models.ForeignKey("blog.Post", related_name="post_to_tag_posts", on_delete=models.CASCADE)

    def __str__(self):
        return f"Tag #{self.tag} for post #{self.post.id}"


class PostManager(models.Manager):
    def ordered(self):
        return self.get_queryset().order_by("-created")

    def music(self):
        return self.get_queryset().filter(is_music=True).order_by("-created")


class Post(BaseModel):
    name = models.CharField(max_length=255)
    name_by = models.CharField(max_length=255)

    meta = models.TextField()
    meta_by = models.TextField()

    summary = models.TextField()
    summary_by = models.TextField()

    description = models.TextField()
    description_by = models.TextField()

    slug = models.SlugField(unique=True, verbose_name=_("Slug"))
    release = models.FileField(
        max_length=255,
        null=True,
        blank=True,
        upload_to=release_path,
        verbose_name=_("Release File"),
    )
    cover = models.ImageField(
        max_length=255,
        null=True,
        blank=True,
        upload_to=cover_path,
        verbose_name=_("Cover Image"),
    )

    is_music = models.BooleanField(blank=True, default=False)
    catnum = models.CharField(max_length=16, blank=True)
    quality = models.CharField(max_length=255, blank=True)
    length = models.CharField(max_length=16, blank=True)
    tracklist = models.TextField(blank=True)

    genres = models.ManyToManyField(
        to="core.Tag",
        through=Genres,
        verbose_name=_("Genre"),
        related_name="post_genres",
        blank=True,
    )
    tags = models.ManyToManyField(
        to="core.Tag",
        through=Tags,
        verbose_name=_("Tags"),
        related_name="post_tags",
        blank=True,
    )

    viewed = models.IntegerField(blank=True, default=0)
    related = models.ManyToManyField("self", blank=True)

    objects = PostManager()

    class Meta:
        verbose_name = _("post")
        verbose_name_plural = _("posts")

    def __str__(self) -> str:
        return self.name

    def get_absolute_url(self) -> str:
        return reverse(self.__class__.__name__.lower(), args=[str(self.slug)])

    def save(self, *args, **kwargs):
        if self.slug is None:
            self.slug = slugify(self.name)
        super().save(*args, **kwargs)

    @property
    def url(self) -> str:
        return reverse("post", kwargs={"slug": self.slug})

    @property
    def release_file_url(self) -> str | None:
        try:
            ext = self.release.url.split(".")[-1]
            return self.release.url.replace(f".{ext}", "")
        except (IndexError, AttributeError, ValueError):
            return None

    @property
    def release_file_name(self) -> str | None:
        try:
            ext = self.release.file.name.split(".")[-1]
            return self.release.file.name.replace(f".{ext}", "")
        except (IndexError, AttributeError, ValueError):
            return None

    @property
    def preview_file_url(self) -> str | None:
        try:
            return self.release_file_url.replace("release", "preview")
        except (IndexError, AttributeError, ValueError):
            return None

    @property
    def preview_file_name(self) -> str | None:
        try:
            return self.release_file_name.replace("release", "preview")
        except (IndexError, AttributeError, ValueError):
            return None

    @property
    def genres_list(self) -> str:
        return ", ".join(self.genres.values_list("name", flat=True))

    @property
    def title(self) -> str:
        return f"{self.name} /{self.genres_list}/"

    @property
    def cover_thumbnail(self) -> str:
        return get_thumbnail(self.cover.file, "50x50", crop="center", quality=85).url

    def as_dict(self) -> dict:
        return {
            "id": self.pk,
            "url": self.url,
            "name": self.name,
            "slug": self.slug,
            "title": self.title,
            "cover": {"original": self.cover.url, "thumbnail": self.cover_thumbnail} if self.cover else None,
            "release": {"mp3": self.release_file_url},
            "preview": {"mp3": self.preview_file_url},
        }

    def as_html(self, context) -> str:
        return render_to_string("blog/list-item.html", {"item": self, **context})


@receiver(post_save, sender=Post, dispatch_uid="flush_caches")
def blog_post_save(sender: str, instance: Post, **kwargs: dict):
    flush_cache(["index", "blog", f"post-{instance.slug}"])
