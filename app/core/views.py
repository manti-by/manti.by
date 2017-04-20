import logging

from django.http import Http404
from django.shortcuts import render


logger = logging.getLogger('app')


def index(request):
    try:
        return render(request, 'index.html')
    except Exception as e:
        logger.exception(e)
        raise Http404


def sitemap(request):
    try:
        return render(request, 'sitemap.html')
    except Exception as e:
        logger.exception(e)
        raise Http404


def static(request, page):
    try:
        return render(request, 'static/%s.html' % page)
    except Exception as e:
        logger.exception(e)
        raise Http404
