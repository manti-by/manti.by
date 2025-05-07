from django.db import models
from django.db.models import QuerySet, Count
from django.utils.timezone import now
from django.utils.translation import gettext_lazy as _


class BaseModel(models.Model):
    created = models.DateTimeField(auto_now_add=True, verbose_name=_("Created, UTC"))
    updated = models.DateTimeField(auto_now=True, verbose_name=_("Updated, UTC"))

    class Meta:
        abstract = True

    def __str__(self) -> str:
        return f"{self.__class__.__name__} #{self.pk}"

    @property
    def human_date(self) -> str:
        delta = now() - self.created
        if delta.total_seconds() < 60 * 60:
            return "just now"
        elif delta.total_seconds() < 60 * 60 * 5:
            result = int(delta.total_seconds() / (60 * 60))
            return f"{result}h ago"
        elif delta.total_seconds() < 60 * 60 * 24:
            return "today"
        elif delta.total_seconds() < 60 * 60 * 24 * 7:
            result = int(delta.total_seconds() / (60 * 60 * 24))
            return f"{result}d ago"
        else:
            return self.created.strftime("%d %b %Y")


class Tag(models.Model):
    name = models.CharField(unique=True, max_length=100)
    slug = models.SlugField(unique=True, max_length=100)

    class Meta:
        verbose_name = _("tag")
        verbose_name_plural = _("tags")

    def __str__(self):
        return f"Tag #{self.slug}"

    @staticmethod
    def most_common() -> QuerySet:
        return Tag.objects.exclude(slug="front").annotate(
            posts_count=Count("post_to_tag_tags__post")
        ).order_by("-posts_count")

