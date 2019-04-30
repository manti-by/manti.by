from django.conf.urls import url

from shortener import views


urlpatterns = [url(r"^(?P<short_link>[-\w]+)$", views.shortener, name="shortener")]
