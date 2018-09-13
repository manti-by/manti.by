import logging

from django.http import Http404
from django.shortcuts import redirect
from raven.contrib.django.raven_compat.models import client

from shortener.models import Link


logger = logging.getLogger()


def shortener(request, short_link):
    try:
        link = Link.objects.get(short_link=short_link)
        return redirect(link.original_link, permanent=True)
    except Link.DoesNotExist as e:
        client.captureException()
        logger.warning(e)
        raise Http404
