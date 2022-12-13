import json
import uuid

from django.conf import settings

from manti_by.apps.blog.models import Post

import pytest


class ApiViewsTest:
    @classmethod
    def setup_class(cls):
        cls.host = settings.LOCALE_URLS[settings.LANGUAGE_CODE]

    @pytest.mark.django_db
    def test_get_posts(self, client):
        Post.objects.create(name=str(uuid.uuid4()), is_music=True)
        response = client.get("/api/posts/", HTTP_HOST=self.host)

        assert response.status_code == 200
        assert response["Content-Type"] == "application/json"

        response = json.loads(response.content.decode())
        assert len(response["data"]), Post.objects.count()
