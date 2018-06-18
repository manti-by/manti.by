import logging

from django.http import JsonResponse
from profiles.models import Profile

logger = logging.getLogger('app')


def resource_wrapper(f):
    def wrapper(*args, **kwargs):
        try:
            return f(*args, **kwargs)
        except Profile.DoesNotExist as e:
            logger.warning(e)
            return JsonResponse({'status': 404,
                                 'message': e}, status=200)
        except Exception as e:
            logger.error(e)
            return JsonResponse({'status': 500,
                                 'message': e}, status=200)
    return wrapper
