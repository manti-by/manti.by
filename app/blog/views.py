from django.views.generic.detail import DetailView
from django.shortcuts import render, get_object_or_404
from django.core.cache import cache

from core.utils import update_cache
from blog.models import Post
from taggit.models import Tag


def index(request):
    tag = request.GET.get('tag')
    cache_key = 'blog-%s-%s-%s' % (request.LANGUAGE_CODE, request.user.id, tag)
    cached_data = cache.get(cache_key)
    if cached_data:
        return cached_data

    if tag:
        try:
            tag = Tag.objects.get(slug__iexact=tag)
            item_list = Post.objects.filter(tags__slug=tag.slug).order_by('-created')[:6]
        except Tag.DoesNotExist as e:
            item_list = []
    else:
        item_list = Post.objects.order_by('-created')[:6]

    cached_data = render(request, 'blog/list.html', {'item_list': item_list, 'tag': tag})
    return update_cache(cache_key, cached_data)


class BlogView(DetailView):
    model = Post
    context_object_name = 'item'

    def get_object(self, queryset=None):
        cache_key = 'post-%s-%s-%s' % (self.request.LANGUAGE_CODE, self.request.user.id,
                                       self.kwargs['slug'])
        cached_data = cache.get(cache_key)
        if cached_data:
            return cached_data
        cached_data = get_object_or_404(Post, slug__iexact=self.kwargs['slug'])
        return update_cache(cache_key, cached_data)
