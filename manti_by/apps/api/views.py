import logging

from django.db.models import Q
from django.http import JsonResponse

from manti_by.apps.blog.models import Post
from manti_by.apps.core.context_processors.common import global_template_vars

logger = logging.getLogger(__name__)


def posts(request):
    tag = request.GET.get("tag", None)
    start = int(request.GET.get("start", 0))
    limit = int(request.GET.get("limit", 100))
    is_music = bool(request.GET.get("is_music", True))
    return_type = request.GET.get("type", "json")

    result = [] if return_type == "html" else {}
    queryset = Post.objects.ordered().filter(is_music=is_music)
    if tag is not None:
        queryset = queryset.filter(tags__slug=tag)

    for p in queryset[start : start + limit]:  # noqa
        if return_type == "html":
            context = global_template_vars(request)
            result.append(p.as_html(context))
        else:
            result[p.id] = p.as_dict()
    return JsonResponse(result, safe=False)


def search(request):
    query = request.GET.get("q")
    queryset = Post.objects.filter(
        Q(name__icontains=query)
        | Q(description__icontains=query)
        | Q(tracklist__icontains=query)
        | Q(genre__name__icontains=query)
        | Q(tags__name__icontains=query)
    ).distinct()
    return JsonResponse([item.as_dict() for item in queryset], safe=False)
