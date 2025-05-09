import logging

from django.core.cache import cache
from django.http import Http404, HttpRequest
from django.shortcuts import render

from manti_by.apps.blog.models import Post
from manti_by.apps.core.utils import update_cache
from manti_by.apps.gallery.models import Image


logger = logging.getLogger(__name__)


def index(request: HttpRequest) -> str:
    cache_key = f"index-{request.LANGUAGE_CODE}"
    cached_data = cache.get(cache_key)
    if cached_data:
        return cached_data
    try:
        featured_image = Image.objects.filter(tags__name__iexact="featured")
        if featured_image:
            featured_image = featured_image[0]
            latest_images = Image.objects.exclude(pk=featured_image.pk).order_by("-order")[:6]
        else:
            latest_images = Image.objects.all().order_by("-order")[:6]

        featured_posts = Post.objects.filter(tags__name__iexact="featured").order_by("created")[:3]
        latest_posts = (
            Post.objects.exclude(pk__in=[p.pk for p in featured_posts])
            .filter(tags__name__iexact="front")
            .order_by("-created")[:4]
        )

        cached_data = render(
            request,
            "index.html",
            {
                "featured_image": featured_image,
                "latest_images": latest_images,
                "featured_posts": featured_posts,
                "latest_posts": latest_posts,
            },
        )
        return update_cache(cache_key, cached_data)
    except Exception as e:
        logger.exception(e)
        raise Http404 from e


def static(request: HttpRequest, page: str) -> str:
    cache_key = f"static-{page}-{request.LANGUAGE_CODE}"
    cached_data = cache.get(cache_key)
    if cached_data:
        return cached_data
    try:
        cached_data = render(request, f"static/{page}.html")
        return update_cache(cache_key, cached_data)
    except Exception as e:
        logger.exception(e)
        raise Http404 from e
