from django.core.cache import cache

from core.utils import update_cache, flush_cache


class CacheTest:
    @staticmethod
    def test_set_and_flush():
        cache_key_1 = "default-cache-key"
        cache_data_1 = {"cache": 1}

        update_cache(cache_key_1, cache_data_1)
        assert cache.get(cache_key_1) == cache_data_1

        flush_cache(["default"])
        assert cache.get(cache_key_1) is None

    @staticmethod
    def test_flush_by_prefix():
        cache_key_1 = "first-cache-key"
        cache_data_1 = {"cache": 1}
        update_cache(cache_key_1, cache_data_1)

        cache_key_2 = "second-cache-key"
        cache_data_2 = {"cache": 2}
        update_cache(cache_key_2, cache_data_2)

        flush_cache(["second"])
        keys = cache.get("keys")
        assert cache_key_1 in keys
        assert cache_key_2 not in keys
