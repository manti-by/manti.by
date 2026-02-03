from django.contrib import admin
from django.db import models
from django.forms import Textarea
from django.http import HttpRequest
from django.templatetags.static import static as static_file
from django.utils.safestring import mark_safe
from django.utils.translation import gettext_lazy as _

from manti_by.apps.blog.models import Post


class PostTagsInline(admin.TabularInline):
    model = Post.tags.through
    extra = 0


class PostGenresInline(admin.TabularInline):
    model = Post.genres.through
    extra = 0


# class PostRelatedInline(admin.TabularInline):
#     model = Post.related.through
#     fk_name = "pk"
#     extra = 0


@admin.register(Post)
class PostAdmin(admin.ModelAdmin):
    formfield_overrides = {models.TextField: {"widget": Textarea(attrs={"rows": 4, "cols": 80})}}

    list_display = (
        "thumb_image",
        "name",
        "catnum",
        "quality",
        "length",
        "is_music",
        "created",
    )

    fieldsets = (
        (_("Base Info"), {"fields": ("name", "name_by", "slug")}),
        (_("Meta Description"), {"fields": ("meta", "meta_by")}),
        (_("Summary"), {"fields": ("summary", "summary_by")}),
        (
            _("Description"),
            {"fields": ("description", "description_by")},
        ),
        # (_("Related"), {"classes": ("collapse",), "fields": ("related",)}),
        (
            _("Music params"),
            {
                "classes": ("collapse",),
                "fields": ("is_music", "catnum", "quality", "length", "tracklist"),
            },
        ),
        (
            _("Files"),
            {
                "classes": ("collapse",),
                "fields": (
                    "cover",
                    "release",
                ),
            },
        ),
    )

    inlines = (
        PostTagsInline,
        PostGenresInline,
        # PostRelatedInline,
    )

    def get_queryset(self, request: HttpRequest) -> models.QuerySet:
        return super().get_queryset(request).prefetch_related("genres", "tags", "related")

    @admin.display(description=_("Image"))
    def thumb_image(self, obj: Post) -> str:
        image = static_file("img/no-image.png")
        if obj.cover:
            image = obj.cover.url
        return mark_safe(f'<img src="{image}" width="50" />')  # noqa
