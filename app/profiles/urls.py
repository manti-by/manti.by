from django.conf.urls import url
from django.views.decorators.cache import cache_page

from profiles import views


urlpatterns = [
    url(r'^$', views.profile_page, name='profile'),
    url(r'^login/?$', views.login_page, name='login'),
    url(r'^logout/?$', views.logout_page, name='logout'),
]
