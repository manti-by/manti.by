from django.views.generic.detail import DetailView
from django.shortcuts import render_to_response, get_object_or_404

from gallery.models import Gallery


def index(request):
    gallery_list = Gallery.objects.order_by('-order')[:6]
    return render_to_response('gallery/list.html', {'gallery_list': gallery_list})


class GalleryView(DetailView):
    model = Gallery
    context_object_name = 'gallery'

    def get_object(self, queryset=None):
        return get_object_or_404(Gallery, slug__iexact=self.kwargs['slug'])
