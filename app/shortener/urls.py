from django.urls import path

from shortener import views


urlpatterns = [path("<short_link>/", views.shortener, name="shortener")]
