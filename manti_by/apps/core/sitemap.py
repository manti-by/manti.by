from django.conf import settings
from django.contrib.sitemaps import Sitemap
from django.urls import reverse

from manti_by.apps.blog.models import Post


class BaseSitemap(Sitemap):
    def get_urls(self, page=1, site=None, protocol=None):
        urls = []
        for lang_code, _ in settings.LANGUAGES:
            domain = settings.LOCALE_URLS.get(lang_code)
            urls += self._urls(page, "https", domain)  # ty: ignore[unresolved-attribute]
        return urls


class IndexSitemap(BaseSitemap):
    changefreq = "weekly"
    priority = 1.0

    def items(self):
        return ["index", "blog", "gallery"]

    def location(self, item):
        return reverse(item)


class BlogSitemap(BaseSitemap):
    changefreq = "monthly"
    priority = 0.8

    def items(self):
        return Post.objects.all()

    def lastmod(self, item):
        return item.updated

    def location(self, item):
        return item.get_absolute_url()


class StaticSitemap(BaseSitemap):
    changefreq = "yearly"
    priority = 0.5

    def items(self):
        return ["about"]

    def location(self, item):
        return reverse(item)
