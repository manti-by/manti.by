import subprocess

from urllib.parse import urlparse

from django.conf import settings
from django.core.cache import cache
from django.http import HttpRequest
from django.urls import reverse
from django.utils.cache import get_cache_key

from core.tasks import convert_to_mp3_preview, convert_to_ogg_preview, convert_to_ogg_release


MP3_PREVIEW = 'mp3_preview'
OGG_PREVIEW = 'ogg_preview'
OGG_RELEASE = 'ogg_release'


def convert_release(ffmpeg_format, post_id, output_type=''):
    from blog.models import Post
    post = Post.objects.get(id=post_id)

    if output_type == OGG_PREVIEW:
        result = post.preview_ogg_file
    elif output_type == OGG_RELEASE:
        result = post.release_ogg_file
    else:
        result = post.preview_mp3_file

    ffmpeg_format.append(result)
    command = ['ffmpeg', '-y', '-nostats', '-loglevel', '0', '-i', post.release_mp3_file] + ffmpeg_format
    subprocess.call(command)


def generate_preview_for_post(post):
    # Generate audio files
    if not post.release:
        return
    if not post.mp3_preview_ready:
        convert_to_mp3_preview.delay(post.id)
    if not post.ogg_preview_ready:
        convert_to_ogg_preview.delay(post.id)
    if not post.ogg_release_ready:
        convert_to_ogg_release.delay(post.id)


def get_page_cache_key(page_url, server, port, locale):
    request = HttpRequest()
    request.META = {'SERVER_NAME': server, 'SERVER_PORT': port}
    request.LANGUAGE_CODE = locale
    request.path = page_url

    try:
        cache_key = get_cache_key(request)
        if cache_key is not None:
            if cache.get(cache_key) is not None:
                return cache_key
    except (ValueError, Exception):
        return None


def flush_blog_caches_for_post(post):
    for locale, domain in settings.LOCALE_URLS.items():
        server = urlparse(domain).netloc
        port = 443 if urlparse(domain).scheme == 'https' else 80

        # Flush homepage and blog caches
        cache_key = get_page_cache_key(reverse('index'), server, port, locale)
        if cache_key is not None:
            cache.delete(cache_key)

        cache_key = get_page_cache_key(reverse('blog'), server, port, locale)
        if cache_key is not None:
            cache.delete(cache_key)

        # Flush page cache
        cache_key = get_page_cache_key(post.url, server, port, locale)
        if cache_key is not None:
            cache.delete(cache_key)
