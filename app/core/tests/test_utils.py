from django.test import TestCase
from django.core.cache import cache

from core.utils import update_cache, flush_cache


class CacheTest(TestCase):

    def test_set_and_flush(self):
        cache_key_1 = 'default-cache-key'
        cache_data_1 = {'cache': 1}

        update_cache(cache_key_1, cache_data_1)
        self.assertEquals(cache.get(cache_key_1), cache_data_1)

        flush_cache(['default'])
        self.assertIsNone(cache.get(cache_key_1))

    def test_flush_by_prefix(self):
        cache_key_1 = 'first-cache-key'
        cache_data_1 = {'cache': 1}
        update_cache(cache_key_1, cache_data_1)

        cache_key_2 = 'second-cache-key'
        cache_data_2 = {'cache': 2}
        update_cache(cache_key_2, cache_data_2)

        flush_cache(['second'])
        keys = cache.get('keys')
        self.assertIn(cache_key_1, keys)
        self.assertNotIn(cache_key_2, keys)
