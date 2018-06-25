from django.test import TestCase

from shortener.models import Link


class LinkModelTest(TestCase):

    def test_create(self):
        link = Link.objects.create(**{'original_link': 'https://google.com'})
        self.assertIsNotNone(link.short_link)
