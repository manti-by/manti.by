from django.contrib import admin
from django.templatetags.static import static as static_file
from django.utils.html import format_html
from django.utils.translation import gettext_lazy as _

from sorl.thumbnail import get_thumbnail

from manti_by.apps.gallery.models import Image


@admin.register(Image)
class ImageAdmin(admin.ModelAdmin):
    list_display = ("image", "order", "created")
    ordering = ("order",)

    fieldsets = ((_("Info"), {"fields": ("original_image", "order")}),)

    @admin.display(description=_("Image"))
    def image(self, obj: Image) -> str:
        image = static_file("img/no-image.png")
        if obj.original_image:
            image = get_thumbnail(obj.original_image, "100x100", crop="center", quality=60)
        return format_html(f'<img src="{image.url}" width="50" />')  # ty: ignore[possibly-missing-attribute]
