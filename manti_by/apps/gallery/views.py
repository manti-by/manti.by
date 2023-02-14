from django.core.cache import cache
from django.shortcuts import render

from manti_by.apps.core.utils import update_cache
from manti_by.apps.gallery.models import Image


def index(request):
    cache_key = f"gallery-{request.LANGUAGE_CODE}-{request.user.id}"
    cached_data = cache.get(cache_key)
    if cached_data:
        return cached_data
    cached_data = render(request, "gallery/gallery.html", {"images": Image.objects.ordered()})
    return update_cache(cache_key, cached_data)
