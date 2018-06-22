from django.conf import settings
from django.conf.urls import include, url
from django.contrib import admin
from django.contrib.sitemaps.views import sitemap

from core import views as core_views
from api.resources import OrderableResource, PostResource, SearchResource
from core.sitemap import IndexSitemap, BlogSitemap, StaticSitemap


sitemaps = {
    'index': IndexSitemap,
    'blog': BlogSitemap,
    'static': StaticSitemap,
}


urlpatterns = [
    url(r'^$', core_views.index, name='index'),
    url(r'^email/(?P<email_id>\d+)/$', core_views.email, name='email'),

    url(r'^about/', core_views.static, {'page': 'about'}, name='about'),
    url(r'^resume/', core_views.static, {'page': 'resume'}, name='resume'),
    url(r'^copyrights/', core_views.static, {'page': 'copyrights'}, name='copyrights'),

    # API urls
    url(r'^api/posts/?$', PostResource.as_view()),
    url(r'^api/orderable/?$', OrderableResource.as_view()),
    url(r'^api/search/?$', SearchResource.as_view()),

    # Blog urls
    url(r'^blog/', include('blog.urls'), name='blog'),

    # Gallery urls
    url(r'^gallery/', include('gallery.urls')),

    # Profile urls
    url(r'^profile/', include('profiles.urls')),

    # Admin urls
    url(r'^dashboard/', admin.site.urls),

    # Sitemap
    url(r'^sitemap\.xml$', sitemap, {'sitemaps': sitemaps}, name='django.contrib.sitemaps.views.sitemap')
]


if settings.DEBUG:
    from django.conf.urls.static import static
    from django.contrib.staticfiles.urls import staticfiles_urlpatterns

    # Serve static and media files from development server
    urlpatterns += staticfiles_urlpatterns()
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
