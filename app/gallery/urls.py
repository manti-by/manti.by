from django.urls import path

from gallery import views


urlpatterns = [path("", views.index, name="gallery_list")]
