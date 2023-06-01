from django.conf import settings
from django.contrib import admin
from django.contrib.sitemaps.views import sitemap
from django.urls import include, path

from manti_by.apps.core import views as core_views
from manti_by.apps.core.sitemap import BlogSitemap, IndexSitemap, StaticSitemap

sitemaps = {"index": IndexSitemap, "blog": BlogSitemap, "static": StaticSitemap}


urlpatterns = [
    path("", core_views.index, name="index"),
    path("about/", core_views.static, {"page": "about"}, name="about"),
    path("api/", include("manti_by.apps.api.urls"), name="api"),
    path("blog/", include("manti_by.apps.blog.urls"), name="blog"),
    path("dashboard/", admin.site.urls),
    path("gallery/", include("manti_by.apps.gallery.urls"), name="gallery"),
    path(
        "sitemap.xml",
        sitemap,
        {"sitemaps": sitemaps},
        name="django.contrib.sitemaps.views.sitemap",
    ),
]


if settings.DEBUG:
    from django.conf.urls.static import static
    from django.contrib.staticfiles.urls import staticfiles_urlpatterns

    # Serve static and media files from development server
    urlpatterns += staticfiles_urlpatterns()
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
