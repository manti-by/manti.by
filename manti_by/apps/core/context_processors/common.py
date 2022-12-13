import httpagentparser
from django.conf import settings

from manti_by.apps.blog.models import Post

WEBP_VALID_BROWSERS = ["Chrome", "Opera", "Opera Mobile"]


def is_supports_webp(request):
    if "webp" in request.META.get("HTTP_ACCEPT", ""):
        return True
    data = httpagentparser.detect(request.META.get("HTTP_USER_AGENT"))
    if "browser" in data and data["browser"]["name"] in WEBP_VALID_BROWSERS:
        return True
    return False


def global_template_vars(request):
    return {
        "DEBUG": settings.DEBUG,
        "ACTIVE_LANGUAGE": request.LANGUAGE_CODE,
        "LANGUAGES": settings.LANGUAGES,
        "ABSOLUTE_URL": request.build_absolute_uri(),
        "BASE_URL": settings.BASE_URL,
        "DATE_FORMAT": settings.DATE_FORMAT,
        "META_TITLE": settings.META_TITLE,
        "user": request.user,
        "tags": Post.tags.most_common()[:10],
        "posts": Post.objects.ordered().filter(is_music=True)[:10],
        "is_supports_webp": is_supports_webp(request),
        "is_home": False,
        "is_secure": request.is_secure,
    }
