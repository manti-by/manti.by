from django.conf import settings
from django.contrib.sitemaps import Sitemap
from django.core.urlresolvers import reverse

from blog.models import Post


class BaseSitemap(Sitemap):

    def get_urls(self, page=1, site=None, protocol=None):
        urls = []
        for lang_code, lang_name in settings.LANGUAGES:
            domain = settings.LOCALE_URLS.get(lang_code)
            urls += self._urls(page, 'https', domain)
        return urls


class IndexSitemap(BaseSitemap):

    changefreq = 'weekly'
    priority = 1.0

    def items(self):
        return ['index', 'blog', 'gallery_list']

    def location(self, item):
        return reverse(item)


class BlogSitemap(BaseSitemap):

    changefreq = 'monthly'
    priority = 0.8

    def items(self):
        return Post.objects.all()

    def lastmod(self, obj):
        return obj.updated

    def location(self, obj):
        return obj.get_absolute_url()


class StaticSitemap(BaseSitemap):

    changefreq = 'yearly'
    priority = 0.5

    def items(self):
        return ['about', 'resume', 'copyrights']

    def location(self, item):
        return reverse(item)
