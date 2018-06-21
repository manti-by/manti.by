from django.core.cache import cache
from django.shortcuts import render

from core.utils import update_cache
from gallery.models import Gallery


def index(request):
    cache_key = 'gallery-%s-%s' % (request.LANGUAGE_CODE, int(request.user.id))
    cached_data = cache.get(cache_key)
    if cached_data:
        return cached_data
    cached_data = render(request, 'gallery/gallery.html', {'gallery': Gallery.objects.last()})
    return update_cache(cache_key, cached_data)
