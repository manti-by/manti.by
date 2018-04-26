import os

from PIL import Image

from django import template
from django.conf import settings
from django.utils import translation

register = template.Library()


@register.simple_tag(takes_context=False)
def get_locale_domain(locale):
    for domain_locale, domain in settings.LOCALE_URLS.items():
        if locale == domain_locale and translation.check_for_language(domain_locale):
            return domain
    return settings.BASE_URL


@register.simple_tag(takes_context=True)
def webp_cover(context, cover):
    is_supports_webp = context.get('is_supports_webp', False)
    if not is_supports_webp:
        return cover.url

    webp_path = os.path.splitext(cover.file.name)[0] + '.webp'
    if not os.path.isfile(webp_path):
        image = Image.open(cover.file.name)
        image.save(webp_path, 'WEBP')

    return cover.url.replace('.jpg', '.webp')
