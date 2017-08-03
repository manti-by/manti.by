from django.conf import settings
from django.utils import translation
from django.utils.deprecation import MiddlewareMixin


class LocaleMiddleware(MiddlewareMixin):

    def process_request(self, request):
        locale = settings.LANGUAGE_CODE
        current_domain = '%s://%s' % ('https' if request.is_secure() else 'http', request.META['HTTP_HOST'])
        for domain_locale, domain in settings.LOCALE_URLS.items():
            if current_domain == domain and translation.check_for_language(domain_locale):
                locale = domain_locale
                break
        translation.activate(locale)
        request.LANGUAGE_CODE = translation.get_language()

    def process_response(self, request, response):
        translation.deactivate()
        return response
