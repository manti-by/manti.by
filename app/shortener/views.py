import logging

from django.http import Http404
from django.shortcuts import redirect
from django.utils.translation import ugettext_lazy as _

from shortener.models import Link


logger = logging.getLogger()


def shortener(request, short_link):
    try:
        link = Link.objects.get(short_link=short_link)
        return redirect(link.original_link, permanent=True)
    except Link.DoesNotExist:
        client.captureException()
        raise Http404
