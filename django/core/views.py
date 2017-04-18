import logging

from django.http import Http404
from django.shortcuts import render
from django.utils import timezone
from django.contrib.auth.decorators import login_required

from ping.models import Site, Ping
from ping.status import messages


logger = logging.getLogger('app')


@login_required
def index(request):
    try:
        sites = Site.objects.filter(user=request.user)
        last_check = Ping.objects.all().order_by('-created')[1]
        return render(request, 'index.html', {'sites': sites,
                                              'server_time': timezone.now(),
                                              'last_check': last_check})
    except Exception as e:
        logger.exception(e)
        raise Http404


def codes(request):
    try:
        code_list = sorted(messages.items())
        return render(request, 'static/codes.html', {'code_list': code_list})
    except Exception as e:
        logger.exception(e)
        raise Http404
