from django.conf.urls import url
from django.views.decorators.cache import cache_page

from gallery import views


urlpatterns = [
    url(r'^$', cache_page(60 * 60 * 24 * 5)(views.index), name='gallery_list'),
    url(r'^(?P<slug>[-\w]+)/$', cache_page(60 * 60 * 24 * 5)(
        views.GalleryView.as_view(template_name='gallery/gallery.html')), name='gallery'),
]
