from django.urls import path

from manti_by.apps.profiles import views

urlpatterns = [
    path("", views.profile_page, name="profile"),
    path("login/", views.login_page, name="login"),
    path("logout/", views.logout_page, name="logout"),
]
