import logging
import os
import random

from django.core.cache import cache

logger = logging.getLogger(__name__)


def unique_str():
    return str("".join([str(random.randint(0, 9)) for _ in range(16)]))  # nosec


def update_cache(cache_key, cached_data, timeout=60 * 60 * 24 * 5):
    keys = cache.get("keys", [])
    keys.append(cache_key)
    cache.set("keys", keys)
    cache.set(cache_key, cached_data, timeout)
    return cached_data


def flush_cache(prefixes):
    keys_to_delete = []
    existing_keys = cache.get("keys", [])
    for key in existing_keys:
        for prefix in prefixes:
            if key.find(prefix) > -1:
                keys_to_delete.append(key)
                existing_keys.remove(key)
    cache.set("keys", existing_keys)
    cache.delete_many(keys_to_delete)


def get_name(instance, filename, typename):
    name, ext = os.path.splitext(filename)
    return "{}/{}/{}{}".format(
        instance.__class__.__name__.lower(),
        typename,
        unique_str(),
        ext,
    )


def profile_image_name(instance, filename):
    return get_name(instance, filename, instance.user.id)


def original_name(instance, filename):
    name, ext = os.path.splitext(filename)
    return f"gallery/{instance.gallery.slug}/{name}{ext}"


def preview_name(instance, filename):
    return get_name(instance, filename, "preview")


def gallery_name(instance, filename):
    return get_name(instance, filename, "gallery")


def thumb_name(instance, filename):
    return get_name(instance, filename, "thumb")


def release_name(instance, filename):
    name, ext = os.path.splitext(filename)
    return f"release/{name}{ext}"


def cover_name(instance, filename):
    name, ext = os.path.splitext(filename)
    return f"covers/{name}{ext}"
