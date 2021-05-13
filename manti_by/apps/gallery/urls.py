from django.urls import path

from manti_by.apps.gallery import views


urlpatterns = [path("", views.index, name="gallery_list")]
