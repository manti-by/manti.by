from django.urls import path

from manti_by.apps.gallery.views import index

urlpatterns = [path("", index, name="gallery")]
