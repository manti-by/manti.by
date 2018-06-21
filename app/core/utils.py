import os
import json
import random
import logging
import requests

from datetime import tzinfo, timedelta

from django.conf import settings
from django.core.cache import cache


logger = logging.getLogger('app')


def unique_str():
    return str(''.join([str(random.randint(0, 9)) for _ in range(16)]))


def get_instagram_photos(limit=6):
    recent_media = []
    cached_data = cache.get('instagram_photos')
    if cached_data is not None:
        return cached_data
    try:
        url = 'https://api.instagram.com/v1/users/self/media/recent/?access_token=%s' \
              % settings.INSTAGRAM_ACCESS_TOKEN
        response = requests.get(url)
        if response.status_code == 200:
            data = json.loads(response.content.decode())
            for item in data['data']:
                recent_media.append({
                    'link': item['link'],
                    'image': item['images']['thumbnail']['url'],
                    'name': item['caption']['text'].split('\n')[0]
                })
        cache.set('instagram_photos', recent_media[:limit], 60 * 60 * 24)
    except Exception as e:
        logger.error(e)
    return recent_media[:limit]


def update_cache(cache_key, cached_data, timeout=60 * 60 * 24 * 5):
    keys = cache.get('keys', [])
    keys.append(cache_key)
    cache.set('keys', keys)
    cache.set(cache_key, cached_data, timeout)
    return cached_data


def flush_cache(prefixes):
    keys_to_delete = []
    existing_keys = cache.get('keys', [])
    for key in existing_keys:
        for prefix in prefixes:
            if key.find(prefix) > -1:
                keys_to_delete.append(key)
                existing_keys.remove(key)
    cache.set('keys', existing_keys)
    cache.delete_many(keys_to_delete)


def get_name(instance, filename, typename):
    name, ext = os.path.splitext(filename)
    return '%s/%s/%s%s' % (instance.__class__.__name__.lower(), typename, unique_str(), ext)


def profile_image_name(instance, filename):
    return get_name(instance, filename, instance.user.id)


def original_name(instance, filename):
    name, ext = os.path.splitext(filename)
    return 'gallery/%s/%s%s' % (instance.gallery.slug, name, ext)


def preview_name(instance, filename):
    return get_name(instance, filename, 'preview')


def gallery_name(instance, filename):
    return get_name(instance, filename, 'gallery')


def thumb_name(instance, filename):
    return get_name(instance, filename, 'thumb')


def release_name(instance, filename):
    name, ext = os.path.splitext(filename)
    return 'release/%s%s' % (name, ext)


def cover_name(instance, filename):
    name, ext = os.path.splitext(filename)
    return 'covers/%s%s' % (name, ext)


ZERO = timedelta(0)


class UTC(tzinfo):

    def utcoffset(self, dt):
        return ZERO

    def tzname(self, dt):
        return "UTC"

    def dst(self, dt):
        return ZERO


utc = UTC()
