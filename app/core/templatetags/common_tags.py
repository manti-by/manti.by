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
