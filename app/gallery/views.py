from django.views.generic.detail import DetailView
from django.shortcuts import render_to_response, get_object_or_404

from gallery.models import Gallery


def index(request):
    item_list = Gallery.objects.all().order_by('-order')[:6]
    return render_to_response('gallery/list.html', {'item_list': item_list})


class GalleryView(DetailView):
    model = Gallery
    context_object_name = 'item'

    def get_object(self, queryset=None):
        return get_object_or_404(Gallery, slug__iexact=self.kwargs['slug'])
