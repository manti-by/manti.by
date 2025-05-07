import os
import shutil
import uuid

from django.conf import settings

import pytest

from manti_by.apps.blog.models import Post
from manti_by.apps.core.models import Tag
from manti_by.apps.gallery.models import Image


@pytest.mark.django_db
class TestPostModel:
    @classmethod
    def setup_class(cls):
        cls.data = {"name": "test", "slug": "test"}

    def test_get(self):
        post = Post.objects.create(**self.data)
        assert post.name == self.data["name"]
        assert post.slug == self.data["name"].lower()
        assert post.created is not None

    def test_update(self):
        post = Post.objects.create(**self.data, is_music=True)
        assert post.is_music is True

    def test_tags(self):
        post = Post.objects.create(**self.data)
        post.genres.add(Tag.objects.create(name="Genre", slug="genre"))
        post.tags.add(Tag.objects.create(name="Tag", slug="tag"))

        assert "Genre" in list(post.genres.values_list("name", flat=True))
        assert "Tag" in list(post.tags.values_list("name", flat=True))
        assert post.title == f"{self.data['name']} /Genre/"


@pytest.mark.django_db
class TestGalleryModel:
    @classmethod
    def setup_class(cls):
        cls.data = {"name": str(uuid.uuid4())}

    def test_files(self):
        image = Image.objects.create(original_image="gallery/test.jpg", order=1)
        assert image.created is not None
        assert image.order is not None
