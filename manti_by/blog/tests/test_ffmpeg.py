import os
from unittest.mock import patch

import pytest
import shutil
import uuid

from django.conf import settings

from manti_by.blog.models import Post
from manti_by.core.services import (
    convert_to_mp3_preview,
    convert_to_ogg_preview,
    convert_to_ogg_release,
)


class FFMpegTest:
    @classmethod
    @pytest.mark.django_db
    def setup_class(cls):
        cls.data = {
            "name": str(uuid.uuid4()),
            "is_music": False,
            "release": "release/test.mp3",
        }

        release_path = os.path.join(settings.MEDIA_ROOT, "release")
        if not os.path.exists(release_path):
            os.makedirs(release_path)

        preview_path = os.path.join(settings.MEDIA_ROOT, "preview")
        if not os.path.exists(preview_path):
            os.makedirs(preview_path)

        shutil.copy(
            os.path.join(settings.PROJECT_DIR, "static", "test", "test.mp3"),
            os.path.join(settings.MEDIA_ROOT, "release", "test.mp3"),
        )

    @classmethod
    def teardown_class(cls):
        release_path = os.path.join(settings.MEDIA_ROOT, "release")
        if os.path.exists(release_path):
            shutil.rmtree(release_path)

        preview_path = os.path.join(settings.MEDIA_ROOT, "preview")
        if os.path.exists(preview_path):
            shutil.rmtree(preview_path)

    @pytest.mark.django_db
    @patch("manti_by.core.services.subprocess")
    def test_convert_to_mp3_preview(self, subprocess_mock):
        subprocess_mock.call.return_value = 0
        post = Post.objects.create(**self.data)
        code = convert_to_mp3_preview(post.id)

        assert code == 0
        assert post.release_mp3_file is not None
        assert subprocess_mock.call.called

    @pytest.mark.django_db
    @patch("manti_by.core.services.subprocess")
    def test_convert_to_ogg_release(self, subprocess_mock):
        subprocess_mock.call.return_value = 0
        post = Post.objects.create(**self.data)
        code = convert_to_ogg_release(post.id)

        assert code == 0
        assert post.release_mp3_file is not None
        assert subprocess_mock.call.called

    @pytest.mark.django_db
    @patch("manti_by.core.services.subprocess")
    def test_convert_to_ogg_preview(self, subprocess_mock):
        subprocess_mock.call.return_value = 0
        post = Post.objects.create(**self.data)
        code = convert_to_ogg_preview(post.id)

        assert code == 0
        assert post.preview_ogg_file is not None
        assert subprocess_mock.call.called
