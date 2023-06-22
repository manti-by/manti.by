from django.urls import path

from manti_by.apps.api.views import posts, search

urlpatterns = [
    path("posts/", posts, name="api_posts"),
    path("search/", search, name="api_search"),
]
