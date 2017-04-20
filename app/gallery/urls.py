from django.conf.urls import url

from gallery import views


urlpatterns = [
    url(r'^$', views.index, name='gallery_list'),
    url(r'^(?P<slug>[-\w]+)/$', views.GalleryView.as_view(template_name='gallery/gallery.html'), name='gallery'),
]
