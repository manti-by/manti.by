from django.conf import settings
from django.utils.translation import ugettext_lazy as _


def global_template_vars(request):
    return {
        'ACTIVE_LANGUAGE': request.LANGUAGE_CODE,
        'LANGUAGES': settings.LANGUAGES,
        'ABSOLUTE_URL': request.build_absolute_uri(),
        'META_TITLE': _(settings.META_TITLE),
        'META_DESCRIPTION': _(settings.META_DESCRIPTION),
        'BASE_URL': settings.BASE_URL
    }
