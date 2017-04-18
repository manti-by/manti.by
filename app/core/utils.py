import logging
import random

from threading import Thread
from datetime import tzinfo, timedelta
from os.path import splitext


logger = logging.getLogger('app')


def unique_str():
    return str(''.join([str(random.randint(0, 9)) for _ in range(16)]))


def get_name(instance, filename, type):
    name, ext = splitext(filename)
    return instance.__class__.__name__.lower() + '/' + type + '/' + unique_str() + ext


def original_name(instance, filename):
    return get_name(instance, filename, 'original')


def preview_name(instance, filename):
    return get_name(instance, filename, 'preview')


def gallery_name(instance, filename):
    return get_name(instance, filename, 'gallery')


def thumb_name(instance, filename):
    return get_name(instance, filename, 'thumb')


def release_name(instance, filename):
    return get_name(instance, filename, 'release')


def cover_name(instance, filename):
    return get_name(instance, filename, 'cover')


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
