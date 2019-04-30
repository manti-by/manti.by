import os
import uuid
import pytest
import shutil

from django.conf import settings

from gallery.models import Gallery, Image


@pytest.mark.django_db
class GalleryModelTest:
    @classmethod
    def setup_class(cls):
        cls.data = {"name": str(uuid.uuid4())}

        release_path = os.path.join(settings.MEDIA_ROOT, "gallery")
        if not os.path.exists(release_path):
            os.mkdir(release_path)

        shutil.copy(
            os.path.join(settings.STATIC_ROOT, "test", "test.jpg"),
            os.path.join(settings.MEDIA_ROOT, "gallery", "test.jpg"),
        )

    def test_gallery_get(self):
        gallery = Gallery.objects.create(**self.data)

        assert gallery.name == self.data["name"]
        assert gallery.slug == self.data["name"].lower()
        assert gallery.created is not None

    def test_gallery_update(self):
        gallery = Gallery.objects.create(**self.data, order=1)
        assert gallery.order is not None

    def test_files(self):
        gallery = Gallery.objects.create(**self.data, order=1)
        image = Image.objects.create(gallery=gallery, original_image="gallery/test.jpg")
        assert image.created is not None
