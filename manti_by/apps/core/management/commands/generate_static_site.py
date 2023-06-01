import logging
import os

from django.conf import settings
from django.core.management.base import BaseCommand
from django.utils import translation

from manti_by.apps.blog.models import GenresProxy, Post
from manti_by.apps.blog.views import index as blog_view
from manti_by.apps.blog.views import post as post_view
from manti_by.apps.core.views import index as index_view
from manti_by.apps.core.views import static as static_view
from manti_by.apps.gallery.views import index as gallery_view

logger = logging.getLogger(__name__)


class DummyRequest:
    META = {"REMOTE_ADDR": "127.0.0.1"}
    GET = {}
    LANGUAGE_CODE = None
    is_secure = None
    path = None

    def build_absolute_uri(self, location: str = "/") -> str:
        return f"{settings.BASE_URL}{location}"


class Command(BaseCommand):
    base_path = "static"

    def handle(self, *args, **options):
        request = DummyRequest()
        os.makedirs(f"{self.base_path}/", exist_ok=True)

        for language in settings.LANGUAGES:
            request.LANGUAGE_CODE = language[0]
            translation.activate(request.LANGUAGE_CODE)

            os.makedirs(f"{self.base_path}/{request.LANGUAGE_CODE}/", exist_ok=True)
            with open(f"{self.base_path}/{request.LANGUAGE_CODE}/index.html", "w") as f:
                page = index_view(request)
                f.write(page.content.decode())

            os.makedirs(f"{self.base_path}/{request.LANGUAGE_CODE}/blog/", exist_ok=True)
            with open(f"{self.base_path}/{request.LANGUAGE_CODE}/blog/index.html", "w") as f:
                page = blog_view(request)
                f.write(page.content.decode())

            for genre in GenresProxy.objects.all():
                with open(f"{self.base_path}/{request.LANGUAGE_CODE}/blog/{genre.tag.slug}.html", "w") as f:
                    request.GET["tag"] = genre.tag.slug
                    page = blog_view(request)
                    f.write(page.content.decode())
                del request.GET["tag"]

            for post in Post.objects.all():
                os.makedirs(f"{self.base_path}/{request.LANGUAGE_CODE}/blog/{post.slug}/", exist_ok=True)
                with open(f"{self.base_path}/{request.LANGUAGE_CODE}/blog/{post.slug}/index.html", "w") as f:
                    page = post_view(request, post.slug)
                    f.write(page.content.decode())

            os.makedirs(f"{self.base_path}/{request.LANGUAGE_CODE}/gallery/", exist_ok=True)
            with open(f"{self.base_path}/{request.LANGUAGE_CODE}/gallery/index.html", "w") as f:
                page = gallery_view(request)
                f.write(page.content.decode())

            os.makedirs(f"{self.base_path}/{request.LANGUAGE_CODE}/about/", exist_ok=True)
            with open(f"{self.base_path}/{request.LANGUAGE_CODE}/about/index.html", "w") as f:
                page = static_view(request, "about")
                f.write(page.content.decode())

            translation.deactivate()
