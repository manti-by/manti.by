from django.conf import settings
from django.contrib import admin
from django.contrib.sitemaps.views import sitemap
from django.urls import include, path

from core import views as core_views
from api.resources import OrderableResource, PostResource, SearchResource
from core.sitemap import IndexSitemap, BlogSitemap, StaticSitemap


sitemaps = {"index": IndexSitemap, "blog": BlogSitemap, "static": StaticSitemap}


urlpatterns = [
    path("", core_views.index, name="index"),
    path("email/<email_id>/", core_views.email, name="email"),
    path("about/", core_views.static, {"page": "about"}, name="about"),
    path("resume/", core_views.static, {"page": "resume"}, name="resume"),
    path("copyrights/", core_views.static, {"page": "copyrights"}, name="copyrights"),
    # API urls
    path("api/posts/", PostResource.as_view()),
    path("api/orderable/", OrderableResource.as_view()),
    path("api/search/", SearchResource.as_view()),
    # Blog urls
    path("blog/", include("blog.urls"), name="blog"),
    # Gallery urls
    path("gallery/", include("gallery.urls")),
    # Profile urls
    path("profile/", include("profiles.urls")),
    # URL shortener
    path("sr/", include("shortener.urls")),
    # Admin urls
    path("dashboard/", admin.site.urls),
    # Django RQ
    path("dashboard/django-rq/", include("django_rq.urls")),
    # Sitemap
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
