import os
import mock
import uuid
import shutil

from django.test import TestCase
from django.conf import settings

from blog.models import Post


class PostModelTest(TestCase):

    @classmethod
    def setUpTestData(cls):
        cls.data = {
            'name': str(uuid.uuid4()),
            'is_music': False
        }
        cls.post = Post.objects.create(**cls.data)

        release_path = os.path.join(settings.MEDIA_ROOT, 'release')
        if not os.path.exists(release_path):
            os.mkdir(release_path)

        shutil.copy(
            os.path.join(settings.STATIC_ROOT, 'test', 'test.mp3'),
            os.path.join(settings.MEDIA_ROOT, 'release', 'test.mp3')
        )

    def test_get(self):
        self.assertEquals(self.post.name, self.data['name'])
        self.assertEquals(self.post.slug, self.data['name'].lower())

        self.assertIsNotNone(self.post.created)
        self.assertFalse(self.post.translations_filled)
        self.assertFalse(self.post.files_converted)

    @mock.patch('blog.models.generate_preview_for_post')
    def test_update(self, generate_mock):
        self.post.is_music = True
        self.post.save()

        self.assertTrue(self.post.is_music)
        self.assertTrue(generate_mock.called)

    def test_tags(self):
        genre = str(uuid.uuid4())
        self.post.genre.add(genre)
        tag = str(uuid.uuid4())
        self.post.tags.add(tag)

        self.assertTrue(genre in self.post.genre.names())
        self.assertTrue(tag in self.post.tags.names())
        self.assertEqual('%s /%s/' % (self.data['name'], genre), self.post.title)

    @mock.patch('blog.models.generate_preview_for_post')
    def test_files(self, generate_mock):
        self.post.release = 'release/test.mp3'
        self.post.save()

        self.assertTrue(generate_mock.called)
        self.assertIsNotNone(self.post.release_mp3_url)
        self.assertIsNotNone(self.post.release_mp3_file)
        self.assertIsNotNone(self.post.preview_mp3_url)
        self.assertIsNotNone(self.post.preview_mp3_file)
        self.assertIsNotNone(self.post.release_ogg_url)
        self.assertIsNotNone(self.post.release_ogg_file)
        self.assertIsNotNone(self.post.preview_ogg_url)
        self.assertIsNotNone(self.post.preview_ogg_file)
