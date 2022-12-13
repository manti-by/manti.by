from manti_by.apps.shortener.models import Link

import pytest


class LinkModelTest:
    @pytest.mark.django_db
    def test_create(self):
        link = Link.objects.create(**{"original_link": "https://google.com"})
        assert link.short_link is not None
