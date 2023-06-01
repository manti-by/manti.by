import os
import shutil
import uuid

from django.conf import settings

from manti_by.apps.gallery.models import Image

import pytest


@pytest.mark.django_db
class GalleryModelTest:
    @classmethod
    def setup_class(cls):
        cls.data = {"name": str(uuid.uuid4())}

        release_path = os.path.join(settings.MEDIA_ROOT, "gallery")
        if not os.path.exists(release_path):
            os.makedirs(release_path)

        shutil.copy(
            os.path.join(settings.PROJECT_DIR, "static", "test", "test.jpg"),
            os.path.join(settings.MEDIA_ROOT, "gallery", "test.jpg"),
        )

    def test_files(self):
        image = Image.objects.create(original_image="gallery/test.jpg", order=1)
        assert image.created is not None
        assert image.order is not None
