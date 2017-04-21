from django.conf import settings


def global_template_vars(request):
    return {
        'ACTIVE_LANGUAGE': request.LANGUAGE_CODE,
        'LANGUAGES': settings.LANGUAGES
    }
