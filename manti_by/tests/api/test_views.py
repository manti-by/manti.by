from django.conf import settings

import pytest

from manti_by.apps.blog.models import Post


@pytest.mark.django_db
class TestApiViews:
    @classmethod
    def setup_class(cls):
        cls.host = settings.LOCALE_URLS[settings.LANGUAGE_CODE]

    def test_posts(self, client):
        Post.objects.create(name="test", slug="test", is_music=True)
        response = client.get("/api/posts/", HTTP_HOST=self.host)

        assert response.status_code == 200
        assert len(response.json()) == Post.objects.count()

    def test_search(self, client):
        Post.objects.create(name="test", slug="test", is_music=True)
        Post.objects.create(name="new", slug="new", is_music=True)
        response = client.get("/api/search/?q=test", HTTP_HOST=self.host)

        assert response.status_code == 200
        assert len(response.json()) == 1
