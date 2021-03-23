import logging

from django.http import Http404
from django.shortcuts import redirect

from manti_by.shortener.models import Link


logger = logging.getLogger(__name__)


def shortener(request, short_link):
    try:
        link = Link.objects.get(short_link=short_link)
        return redirect(link.original_link, permanent=True)
    except Link.DoesNotExist as e:
        logger.warning(e)
        raise Http404
