from django.core.cache import cache
from django.shortcuts import render

from manti_by.core.utils import update_cache
from manti_by.gallery.models import Gallery


def index(request):
    cache_key = "gallery-%s-%s" % (request.LANGUAGE_CODE, request.user.id)
    cached_data = cache.get(cache_key)
    if cached_data:
        return cached_data
    cached_data = render(
        request, "gallery/gallery.html", {"gallery": Gallery.objects.last()}
    )
    return update_cache(cache_key, cached_data)
