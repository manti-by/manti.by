from django.contrib import admin
from django.db import models
from django.forms import Textarea
from django.http import HttpRequest
from django.templatetags.static import static as static_file
from django.utils.safestring import mark_safe
from django.utils.translation import gettext_lazy as _

from manti_by.apps.blog.models import Post


@admin.register(Post)
class PostAdmin(admin.ModelAdmin):
    formfield_overrides = {models.TextField: {"widget": Textarea(attrs={"rows": 4, "cols": 80})}}

    list_display = (
        "thumb_image",
        "name",
        "is_music",
        "catnum",
        "is_translations_filled",
        "created",
    )

    fieldsets = (
        (_("Base Info"), {"fields": ("name_be", "name_ru", "name_en", "slug")}),
        (_("Meta Description"), {"fields": ("meta_be", "meta_ru", "meta_en")}),
        (_("Summary"), {"fields": ("summary_be", "summary_ru", "summary_en")}),
        (
            _("Description"),
            {"fields": ("description_be", "description_ru", "description_en")},
        ),
        (_("Related"), {"classes": ("collapse",), "fields": ("related",)}),
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

    def get_queryset(self, request: HttpRequest) -> models.QuerySet:
        return super().get_queryset(request).prefetch_related("genre", "tags")

    def thumb_image(self, obj: Post) -> str:
        image = static_file("img/no-image.png")
        if obj.cover:
            image = obj.cover.url
        return mark_safe(f'<img src="{image}" width="50" />')  # noqa

    thumb_image.short_description = _("Image")

    def is_translations_filled(self, obj: Post) -> bool:
        return obj.translations_filled

    is_translations_filled.boolean = True
    is_translations_filled.short_description = _("Translations Ready")
