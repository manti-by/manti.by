from django.conf import settings
from django.utils import translation


class LocaleMiddleware:

    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        locale = settings.LANGUAGE_CODE
        current_domain = request.META.get('HTTP_HOST')

        if 'dashboard' in request.path:
            locale = 'ru'
        else:
            for domain_locale, domain in settings.LOCALE_URLS.items():
                if current_domain == domain and translation.check_for_language(domain_locale):
                    locale = domain_locale
                    break

        translation.activate(locale)
        request.LANGUAGE_CODE = translation.get_language()

        response = self.get_response(request)
        translation.deactivate()

        return response
