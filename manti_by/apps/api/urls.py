from django.urls import path

from manti_by.apps.api.views import orderable, posts, search

urlpatterns = [
    path("posts/", posts, name="api_posts"),
    path("orderable/", orderable, name="api_orderable"),
    path("search/", search, name="api_search"),
]
