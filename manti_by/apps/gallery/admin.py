from django.contrib import admin
from django.templatetags.static import static as static_file
from django.utils.safestring import mark_safe
from django.utils.translation import gettext_lazy as _
from sorl.thumbnail import get_thumbnail

from manti_by.apps.gallery.models import Image


@admin.register(Image)
class ImageAdmin(admin.ModelAdmin):
    list_display = ("image", "order", "created")
    ordering = ("order",)

    fieldsets = ((_("Info"), {"fields": ("original_image", "tags", "order")}),)

    def image(self, obj):
        image = static_file("img/no-image.png")
        if obj.original_image:
            image = get_thumbnail(obj.original_image, "100x100", crop="center", quality=60)
        return mark_safe(f'<img src="{image.url}" width="50" />')  # nosec

    image.short_description = _("Image")

    def is_ready(self, obj):
        return obj.ready

    is_ready.boolean = True
    is_ready.short_description = _("Ready")
