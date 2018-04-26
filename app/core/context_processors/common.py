import httpagentparser

from django.conf import settings
from django.utils.translation import ugettext_lazy as _

from blog.models import Post
from core.utils import get_instagram_photos


WEBP_VALID_BROWSERS = ['Chrome', 'Opera', 'Opera Mobile']


def is_supports_webp(request):
    if 'webp' in request.META.get('HTTP_ACCEPT', ''):
        return True
    data = httpagentparser.detect(request.META.get('HTTP_USER_AGENT'))
    if 'browser' in data and data['browser']['name'] in WEBP_VALID_BROWSERS:
        return True
    return False


def global_template_vars(request):
    return {
        'DEBUG': settings.DEBUG,
        'ACTIVE_LANGUAGE': request.LANGUAGE_CODE,
        'LANGUAGES': settings.LANGUAGES,
        'ABSOLUTE_URL': request.build_absolute_uri(),
        'META_TITLE': _(settings.META_TITLE),
        'META_DESCRIPTION': _(settings.META_DESCRIPTION),
        'BASE_URL': settings.BASE_URL,
        'DATE_FORMAT': settings.DATE_FORMAT,
        'user': request.user,
        'tags': Post.tags.most_common()[:10],
        'posts': Post.objects.ordered()[:10],
        'instagram_photos': get_instagram_photos(),
        'is_supports_webp': is_supports_webp(request),
        'is_home': False,
    }
