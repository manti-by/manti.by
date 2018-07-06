import os
import uuid
import shutil

from django.test import TestCase
from django.conf import settings

from gallery.models import Gallery, Image


class GalleryModelTest(TestCase):

    @classmethod
    def setUpTestData(cls):
        cls.data = {
            'name': str(uuid.uuid4())
        }
        cls.gallery = Gallery.objects.create(**cls.data)

        release_path = os.path.join(settings.MEDIA_ROOT, 'gallery')
        if not os.path.exists(release_path):
            os.mkdir(release_path)

        shutil.copy(
            os.path.join(settings.STATIC_ROOT, 'test', 'test.jpg'),
            os.path.join(settings.MEDIA_ROOT, 'gallery', 'test.jpg')
        )

    def test_gallery_get(self):
        self.assertEquals(self.gallery.name, self.data['name'])
        self.assertEquals(self.gallery.slug, self.data['name'].lower())
        self.assertIsNotNone(self.gallery.created)

    def test_gallery_update(self):
        self.gallery.order = 1
        self.gallery.save()
        self.assertTrue(self.gallery.order)

    def test_files(self):
        image = Image(gallery=self.gallery,
                      original_image='gallery/test.jpg')
        image.save()
        self.assertIsNotNone(image.created)
