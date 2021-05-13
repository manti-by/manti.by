import logging

from django.http import Http404
from django.shortcuts import render
from django.core.cache import cache

from manti_by.apps.core.models import Email
from manti_by.apps.core.utils import update_cache
from manti_by.apps.blog.models import Post
from manti_by.apps.gallery.models import Image


logger = logging.getLogger(__name__)


def index(request):
    cache_key = "index-%s-%s" % (request.LANGUAGE_CODE, request.user.id)
    cached_data = cache.get(cache_key)
    if cached_data:
        return cached_data
    try:
        featured_image = Image.objects.filter(tags__name__iexact="featured")
        if featured_image:
            featured_image = featured_image[0]
            latest_images = Image.objects.exclude(pk=featured_image.pk).order_by(
                "-created"
            )[:6]
        else:
            latest_images = Image.objects.all().order_by("-created")[:6]

        featured_posts = Post.objects.filter(tags__name__iexact="featured")[:3]
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
        raise Http404


def static(request, page):
    cache_key = "static-%s-%s-%s" % (page, request.LANGUAGE_CODE, request.user.id)
    cached_data = cache.get(cache_key)
    if cached_data:
        return cached_data
    try:
        cached_data = render(request, "static/%s.html" % page)
        return update_cache(cache_key, cached_data)
    except Exception as e:
        logger.exception(e)
        raise Http404


def email(request, email_id):
    cache_key = "static-%s-%s-%s" % (email_id, request.LANGUAGE_CODE, request.user.id)
    cached_data = cache.get(cache_key)
    if cached_data:
        return cached_data
    try:
        mail = Email.objects.get(id=email_id)
        cached_data = render(request, "emails/email.html", {"email": mail})
        return update_cache(cache_key, cached_data)
    except Exception as e:
        logger.exception(e)
        raise Http404
