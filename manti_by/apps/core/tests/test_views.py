import uuid

from django.conf import settings

from manti_by.apps.blog.models import Post

import pytest


@pytest.mark.django_db
class ViewsTest:
    @classmethod
    def setup_class(cls):
        cls.host = settings.LOCALE_URLS[settings.LANGUAGE_CODE]

    @staticmethod
    def assert_template_used(response, template):
        assert template in [t.name for t in response.templates]

    def test_index(self, client):
        response = client.get("/", HTTP_HOST=self.host)

        assert response.status_code == 200
        self.assert_template_used(response, "index.html")

    def test_blog(self, client):
        response = client.get("/blog/", HTTP_HOST=self.host)

        assert response.status_code == 200
        self.assert_template_used(response, "blog/list.html")

    def test_post(self, client):
        post = Post.objects.create(name=str(uuid.uuid4()), is_music=True)
        response = client.get(post.url, HTTP_HOST=self.host)

        assert response.status_code == 200
        self.assert_template_used(response, "blog/post.html")

    def test_gallery(self, client):
        response = client.get("/gallery/", HTTP_HOST=self.host)

        assert response.status_code == 200
        self.assert_template_used(response, "gallery/gallery.html")

    def test_static(self, client):
        response = client.get("/about/", HTTP_HOST=self.host)

        assert response.status_code == 200
        self.assert_template_used(response, "static/about.html")
