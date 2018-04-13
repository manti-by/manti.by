from django.conf.urls import url
from django.views.decorators.cache import cache_page

from profiles import views


urlpatterns = [
    url(r'^$', cache_page(60 * 60 * 24 * 30)(views.profile_page), name='profile'),
    url(r'^login/?$', cache_page(60 * 60 * 24 * 30)(views.login_page), name='login'),
    url(r'^logout/?$', cache_page(60 * 60 * 24 * 30)(views.logout_page), name='logout'),
]
