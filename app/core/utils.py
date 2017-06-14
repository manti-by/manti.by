import logging
import random

from threading import Thread
from datetime import tzinfo, timedelta
from os.path import splitext

from django.conf import settings

from instagram.client import InstagramAPI


logger = logging.getLogger('app')


def unique_str():
    return str(''.join([str(random.randint(0, 9)) for _ in range(16)]))


def get_instagram_photos(limit=10):
    try:
        api = InstagramAPI(access_token=settings.INSTAGRAM_ACCESS_TOKEN,
                           client_secret=settings.INSTAGRAM_CLIENT_SECRET)
        recent_media, next_ = api.user_recent_media(user_id='self', count=limit)
        return recent_media
    except Exception as e:
        logger.error(e)
    return []


def get_name(instance, filename, typename):
    name, ext = splitext(filename)
    return '%s/%s/%s%s' % (instance.__class__.__name__.lower(), typename, unique_str(), ext)


def profile_image_name(instance, filename):
    return get_name(instance, filename, instance.user.id)


def original_name(instance, filename):
    return get_name(instance, filename, 'original')


def preview_name(instance, filename):
    return get_name(instance, filename, 'preview')


def gallery_name(instance, filename):
    return get_name(instance, filename, 'gallery')


def thumb_name(instance, filename):
    return get_name(instance, filename, 'thumb')


def release_name(instance, filename):
    name, ext = splitext(filename)
    return 'release/%s%s' % (name, ext)


def cover_name(instance, filename):
    name, ext = splitext(filename)
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


def postpone(function):
  def decorator(*args, **kwargs):
    t = Thread(target = function, args=args, kwargs=kwargs)
    t.daemon = True
    t.start()
  return decorator


class cached_property(object):

    def __init__(self, func):
        self.func = func
        self.name = func.__name__

    def __get__(self, instance, cls=None):
        if self.name not in instance.__dict__:
            result = instance.__dict__[self.name] = self.func(instance)
            return result
        return instance.__dict__[self.name]

    def __set__(self, instance, value):
        instance.__dict__[self.name] = value

    def __delete__(self, instance):
        del instance.__dict__[self.name]
