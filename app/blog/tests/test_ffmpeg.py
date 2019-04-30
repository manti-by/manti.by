import os
import uuid
import pytest
import shutil

from django.conf import settings

from blog.models import Post
from core.tasks import (
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

        print("Create directories for FFMpegTest")

        release_path = os.path.join(settings.MEDIA_ROOT, "release")
        if not os.path.exists(release_path):
            os.mkdir(release_path)

        preview_path = os.path.join(settings.MEDIA_ROOT, "preview")
        if not os.path.exists(preview_path):
            os.mkdir(preview_path)

        print("Copy test files")
        shutil.copy(
            os.path.join(settings.STATIC_ROOT, "test", "test.mp3"),
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
    @pytest.mark.skip(reason="Cant run ffmpeg in the CI box")
    def test_convert_to_mp3_preview(self):
        post = Post.objects.create(**self.data)
        code = convert_to_mp3_preview(post.id)

        assert code == 0
        assert post.release_mp3_file is not None
        assert os.path.getsize(post.preview_mp3_file) > 0

    @pytest.mark.django_db
    @pytest.mark.skip(reason="Cant run ffmpeg in the CI box")
    def test_convert_to_ogg_release(self):
        post = Post.objects.create(**self.data)
        code = convert_to_ogg_release(post.id)

        assert code == 0
        assert post.release_mp3_file is not None
        assert os.path.getsize(post.release_ogg_file) > 0

    @pytest.mark.django_db
    @pytest.mark.skip(reason="Cant run ffmpeg in the CI box")
    def test_convert_to_ogg_preview(self):
        post = Post.objects.create(**self.data)
        code = convert_to_ogg_preview(post.id)

        assert code == 0
        assert post.preview_ogg_file is not None
        assert os.path.getsize(post.preview_ogg_file) > 0
