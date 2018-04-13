from django.conf import settings
from django.conf.urls import include, url
from django.views.decorators.cache import cache_page
from django.contrib import admin

from core import views as core_views
from api.resources import OrderableResource, PostResource

urlpatterns = [
    url(r'^$', cache_page(60 * 60 * 24 * 5)(core_views.index), name='index'),
    url(r'^email/(?P<email_id>\d+)/$', cache_page(60 * 60 * 24 * 30)(core_views.email), name='email'),

    url(r'^about$', cache_page(60 * 60 * 24 * 30)(core_views.static), {'page': 'about'}, name='about'),
    url(r'^resume$', cache_page(60 * 60 * 24 * 30)(core_views.static), {'page': 'resume'}, name='resume'),
    url(r'^copyrights$', cache_page(60 * 60 * 24 * 30)(core_views.static), {'page': 'copyrights'}, name='copyrights'),

    # API urls
    url(r'^api/posts/?$', PostResource.as_view()),
    url(r'^api/orderable/?$', OrderableResource.as_view()),

    # Blog urls
    url(r'^blog/', include('blog.urls')),

    # Gallery urls
    url(r'^gallery/', include('gallery.urls')),

    # Profile urls
    url(r'^profile/', include('profiles.urls')),

    # Admin urls
    url(r'^dashboard/', admin.site.urls),
]


if settings.DEBUG:
    from django.conf.urls.static import static
    from django.contrib.staticfiles.urls import staticfiles_urlpatterns

    # Serve static and media files from development server
    urlpatterns += staticfiles_urlpatterns()
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
