import uuid

from django.test import TestCase
from django.test import Client
from django.conf import settings

from blog.models import Post


class ViewsTest(TestCase):

    @classmethod
    def setUpTestData(cls):
        cls.host = settings.LOCALE_URLS[
            settings.LANGUAGE_CODE
        ]
        cls.client = Client()
        cls.post = Post.objects.create(name=str(uuid.uuid4()))

    def call(self, url):
        return self.client.get(url, HTTP_HOST=self.host)

    def test_index(self):
        response = self.call('/')
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'index.html')

    def test_blog(self):
        response = self.call('/blog/')
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'blog/list.html')

    def test_post(self):
        response = self.call(self.post.url)
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'blog/post.html')

    def test_gallery(self):
        response = self.call('/gallery/')
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'gallery/gallery.html')

    def test_static(self):
        response = self.call('/about/')
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'static/about.html')
