from __future__ import absolute_import, unicode_literals

from django.conf import settings
from django.conf.urls import url
from django.contrib import admin

from core import views as core_views
from api.resources import ImageResource
from profiles.views import profile_page, login_page, logout_page


urlpatterns = [
    url(r'^$', core_views.index, name='index'),
    url(r'^about$', core_views.static, {'page': 'about'}, name='about'),
    url(r'^resume$', core_views.static, {'page': 'resume'}, name='resume'),
    url(r'^copyrights$', core_views.static, {'page': 'copyrights'}, name='copyrights'),

    # API urls
    url(r'^api/images/?$', ImageResource.as_view()),

    # Profile urls
    url(r'^profiles/?$', profile_page, name='profile'),
    url(r'^profiles/login/?$', login_page, name='login'),
    url(r'^profiles/logout/?$', logout_page, name='logout'),

    # Admin urls
    url(r'^dashboard/', admin.site.urls),
]


if settings.DEBUG:
    from django.conf.urls.static import static
    from django.contrib.staticfiles.urls import staticfiles_urlpatterns

    # Serve static and media files from development server
    urlpatterns += staticfiles_urlpatterns()
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
