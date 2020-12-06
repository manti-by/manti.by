from django.urls import path

from blog import views


urlpatterns = [
    path("", views.index, name="blog"),
    path("<slug>/", views.post, name="post"),
]
