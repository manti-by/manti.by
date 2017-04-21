from django.views.generic.detail import DetailView
from django.shortcuts import render_to_response, get_object_or_404

from blog.models import Post


def index(request):
    item_list = Post.objects.order_by('-created')[:6]
    return render_to_response('blog/list.html', {'item_list': item_list})


class BlogView(DetailView):
    model = Post
    context_object_name = 'item'

    def get_object(self, queryset=None):
        return get_object_or_404(Post, slug__iexact=self.kwargs['slug'])
