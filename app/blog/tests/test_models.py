from django.test import TestCase

from blog.models import Post


class PostModelTest(TestCase):

    @classmethod
    def setUpTestData(cls):
        Post.objects.create(name='Test')

    def test_false_is_false(self):
        post = Post.objects.get(id=1)
        self.assertEquals(post.name, 'Test')
        self.assertEquals(post.translations_filled, False)
