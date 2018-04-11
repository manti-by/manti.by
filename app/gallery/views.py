from django.views.generic.detail import DetailView
from django.shortcuts import render, get_object_or_404

from gallery.models import Gallery


def index(request):
    gallery = Gallery.objects.first()
    return render(request, 'gallery/single.html', {'gallery': gallery})


class GalleryView(DetailView):
    model = Gallery
    context_object_name = 'gallery'

    def get_object(self, queryset=None):
        return get_object_or_404(Gallery, slug__iexact=self.kwargs['slug'])
