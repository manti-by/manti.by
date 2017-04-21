from django.utils import translation
from django.utils.deprecation import MiddlewareMixin


class LocaleMiddleware(MiddlewareMixin):

    def process_request(self, request):
        language = request.COOKIES.get(translation.LANGUAGE_SESSION_KEY)
        if not translation.check_for_language(language):
            language = translation.get_language_from_request(request)
        translation.activate(language)
        request.LANGUAGE_CODE = translation.get_language()

    def process_response(self, request, response):
        translation.deactivate()
        return response
