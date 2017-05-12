from django.views.generic.detail import DetailView
from django.shortcuts import render, get_object_or_404

from blog.models import Post


def index(request):
    item_list = Post.objects.order_by('-created')[:6]
    return render(request, 'blog/list.html', {'item_list': item_list})


class BlogView(DetailView):
    model = Post
    context_object_name = 'item'

    def get_object(self, queryset=None):
        return get_object_or_404(Post, slug__iexact=self.kwargs['slug'])
