from django.conf import settings

import pytest


@pytest.mark.django_db
class TestAdmin:
    @classmethod
    def setup_class(cls):
        cls.host = settings.LOCALE_URLS[settings.LANGUAGE_CODE]

    def test_admin_index(self, client):
        response = client.get("/dashboard/", follow=True, HTTP_HOST=self.host)
        assert response.status_code == 200
