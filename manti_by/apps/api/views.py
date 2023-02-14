import json
import logging

from django.db.models import Q
from django.http import HttpResponseForbidden, JsonResponse
from django.utils.translation import gettext_lazy as _

from manti_by.apps.blog.models import Post
from manti_by.apps.core.context_processors.common import global_template_vars
from manti_by.apps.gallery.models import Image

logger = logging.getLogger(__name__)


def orderable(request):
    if not request.user.is_superuser:
        return HttpResponseForbidden()

    data = json.loads(request.POST.get("data"))
    if len(data):
        for item in data:
            try:
                obj = Image.objects.get(pk=item["id"])
                obj.order = item["order"]
                obj.save()
                item["result"] = _("Updated")
            except Exception as e:
                logger.exception(e)
                item["result"] = e
        return JsonResponse(data, safe=False)


def posts(request):
    tag = request.GET.get("tag", None)
    start = int(request.GET.get("start", 0))
    limit = int(request.GET.get("limit", 100))
    is_music = bool(request.GET.get("is_music", True))
    return_type = request.GET.get("type", "json")

    result = []
    queryset = Post.objects.ordered().filter(is_music=is_music)
    if tag is not None:
        queryset = queryset.filter(tags__slug=tag)

    for p in queryset[start : start + limit]:  # noqa
        if return_type == "html":
            context = global_template_vars(request)
            result.append(p.as_html(context))
        else:
            result.append(p.as_dict())
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
