from django.urls import path

from manti_by.apps.shortener import views

urlpatterns = [path("<short_link>/", views.shortener, name="shortener")]
