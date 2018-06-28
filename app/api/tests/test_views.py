import json
import uuid

from django.test import TestCase
from django.test import Client
from django.conf import settings

from blog.models import Post


class ApiViewsTest(TestCase):

    @classmethod
    def setUpTestData(cls):
        cls.host = settings.LOCALE_URLS[
            settings.LANGUAGE_CODE
        ]
        cls.client = Client()
        cls.post = Post.objects.create(name=str(uuid.uuid4()),
                                       is_music=True)

    def call(self, url):
        return self.client.get(url, HTTP_HOST=self.host)

    def test_get_posts(self):
        response = self.call('/api/posts/')

        self.assertEqual(response.status_code, 200)
        self.assertEqual(response['Content-Type'], 'application/json')

        response = json.loads(response.content.decode())
        self.assertEqual(len(response['data']), Post.objects.count())
