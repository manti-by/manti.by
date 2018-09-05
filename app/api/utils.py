import logging

from django.http import JsonResponse
from raven.contrib.django.raven_compat.models import client

from profiles.models import Profile

logger = logging.getLogger()


def resource_wrapper(f):
    def wrapper(*args, **kwargs):
        try:
            return f(*args, **kwargs)
        except Profile.DoesNotExist as e:
            client.captureException()
            return JsonResponse({'status': 404,
                                 'message': e}, status=200)
        except Exception as e:
            client.captureException()
            return JsonResponse({'status': 500,
                                 'message': e}, status=200)
    return wrapper
