import os

from django import template
from django.conf import settings
from django.templatetags.static import static
from django.utils import translation
from PIL import Image

register = template.Library()


@register.simple_tag(takes_context=True)
def get_locale_domain(context, locale):
    for domain_locale, domain in settings.LOCALE_URLS.items():
        if locale == domain_locale and translation.check_for_language(domain_locale):
            protocol = "http" if context.get("is_secure", False) else "https"
            return f"{protocol}://{domain}"
    return settings.BASE_URL


@register.simple_tag(takes_context=True)
def webp_cover(context, cover):
    is_supports_webp = context.get("is_supports_webp", False)

    if not cover:
        return static("img/no-image.webp") if is_supports_webp else static("img/no-image.png")

    if not is_supports_webp:
        return cover.url

    jpeg_path = os.path.join(cover.storage.location, cover.name)
    webp_path = os.path.splitext(jpeg_path)[0] + ".webp"
    if not os.path.isfile(webp_path):
        image = Image.open(jpeg_path)
        image.save(webp_path, "WEBP", quality=90)

    return cover.url.replace(".jpg", ".webp")


@register.simple_tag(takes_context=True)
def webp_static(context, static_path):
    if not context.get("is_supports_webp", False):
        return static(static_path)

    full_path = os.path.join(settings.STATICFILES_DIRS[0], static_path)
    original_ext = os.path.splitext(full_path)[1]
    webp_path = os.path.splitext(full_path)[0] + ".webp"
    if not os.path.isfile(webp_path):
        image = Image.open(full_path)
        image.save(webp_path, "WEBP", quality=90)

    return static(static_path.replace(original_ext, ".webp"))


@register.simple_tag(takes_context=True)
def rel_webp_png(context):
    if context.get("is_supports_webp", False):
        return "image/webp"
    return "image/png"
