from __future__ import annotations

import logging
import os
import random
from typing import TYPE_CHECKING, Any

from django.core.cache import cache


if TYPE_CHECKING:
    from manti_by.apps.blog.models import Post
    from manti_by.apps.gallery.models import Image


logger = logging.getLogger(__name__)


def unique_str() -> str:
    return str("".join([str(random.randint(0, 9)) for _ in range(16)]))  # noqa


def update_cache(cache_key: str, cached_data: Any, timeout: int | None = 60 * 60 * 24 * 5) -> Any:
    keys = cache.get("keys", [])
    keys.append(cache_key)
    cache.set("keys", keys)
    cache.set(cache_key, cached_data, timeout)
    return cached_data


def flush_cache(prefixes: list[str]) -> None:
    keys_to_delete = []
    existing_keys = cache.get("keys", [])
    for key in existing_keys:
        for prefix in prefixes:
            if key.find(prefix) > -1:
                keys_to_delete.append(key)
                existing_keys.remove(key)
    cache.set("keys", existing_keys)
    cache.delete_many(keys_to_delete)


def get_name(instance: Image, filename: str, typename: str) -> str:
    name, ext = os.path.splitext(filename)
    return f"{instance.__class__.__name__.lower()}/{typename}/{unique_str()}{ext}"


def original_name(instance: Image, filename: str) -> str:
    name, ext = os.path.splitext(filename)
    return f"gallery/{name}{ext}"


def preview_name(instance: Image, filename: str) -> str:
    return get_name(instance, filename, "preview")


def gallery_name(instance: Image, filename: str) -> str:
    return get_name(instance, filename, "gallery")


def thumb_name(instance: Image, filename: str) -> str:
    return get_name(instance, filename, "thumb")


def release_name(instance: Post, filename: str) -> str:
    name, ext = os.path.splitext(filename)
    return f"release/{name}{ext}"


def cover_name(instance: Post, filename: str) -> str:
    name, ext = os.path.splitext(filename)
    return f"covers/{name}{ext}"
