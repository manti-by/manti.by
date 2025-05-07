from django.core.cache import cache
from django.http import Http404, HttpRequest, HttpResponse
from django.shortcuts import render
from django.utils.translation import gettext_lazy as _

from manti_by.apps.blog.models import Post
from manti_by.apps.core.models import Tag
from manti_by.apps.core.utils import update_cache


def index(request: HttpRequest) -> HttpResponse:
    tag = request.GET.get("tag")
    cache_key = f"blog-{request.LANGUAGE_CODE}-{tag}"
    cached_data = cache.get(cache_key)
    if cached_data:
        return cached_data

    if tag:
        try:
            tag = Tag.objects.get(slug__iexact=tag)
            item_list = Post.objects.filter(tags__slug=tag.slug).order_by("-created")[:6]
        except Tag.DoesNotExist:
            item_list = []
    else:
        item_list = Post.objects.order_by("-created")[:6]
    cached_data = render(request, "blog/list.html", {"item_list": item_list, "tag": tag})
    return update_cache(cache_key, cached_data)


def post(request: HttpRequest, slug: str) -> HttpResponse:
    cache_key = f"post-{slug}-{request.LANGUAGE_CODE}"
    cached_data = cache.get(cache_key)
    if cached_data:
        return cached_data
    try:
        item = Post.objects.get(slug__iexact=slug)
        template = "blog/post.html" if item.is_music else "blog/simple.html"
        cached_data = render(request, template, {"item": item})
        return update_cache(cache_key, cached_data)
    except Post.DoesNotExist as e:
        raise Http404(_("Post with slug %s does not exists") % slug) from e
