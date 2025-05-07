from django.conf import settings

from manti_by.apps.core.models import Tag
from manti_by.apps.blog.models import Post


def template_vars(request):
    return {
        "DEBUG": settings.DEBUG,
        "ACTIVE_LANGUAGE": request.LANGUAGE_CODE,
        "LANGUAGES": settings.LANGUAGES,
        "ABSOLUTE_URL": request.build_absolute_uri(),
        "BASE_URL": settings.BASE_URL,
        "DATE_FORMAT": settings.DATE_FORMAT,
        "META_TITLE": settings.META_TITLE,
        "tags": Tag.most_common()[:10],
        "posts": Post.objects.music()[:10],
        "is_secure": request.is_secure,
        "is_home": False,
    }
