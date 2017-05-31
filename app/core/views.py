import logging

from django.http import HttpResponse, Http404, HttpResponseNotAllowed
from django.shortcuts import render
from django.utils import translation

from core.models import Email
from blog.models import Post
from gallery.models import Image


logger = logging.getLogger('app')


def index(request):
    try:
        featured_image = Image.objects.filter(tags__name__iexact='featured')
        if featured_image:
            featured_image = featured_image[0]
            latest_images = Image.objects.exclude(pk=featured_image.pk).order_by('-created')[:6]
        else:
            latest_images = Image.objects.all().order_by('-created')[:6]
        featured_posts = Post.objects.filter(tags__name__iexact='featured')[:3]
        latest_posts = Post.objects.exclude(pk__in=[p.pk for p in featured_posts]).order_by('-created')[:4]
        return render(request, 'index.html', {'featured_image': featured_image,
                                              'latest_images': latest_images,
                                              'featured_posts': featured_posts,
                                              'latest_posts': latest_posts})
    except Exception as e:
        logger.exception(e)
        raise Http404


def static(request, page):
    try:
        return render(request, 'static/%s.html' % page)
    except Exception as e:
        logger.exception(e)
        raise Http404


def email(request, email_id):
    try:
        e = Email.objects.get(id=email_id)
        return render(request, 'emails/email.html', {'email': e})
    except Exception as e:
        logger.exception(e)
        raise Http404


def language(request):
    if request.method == 'POST':
        language = request.POST.get('language', None)
        if language and translation.check_for_language(language):
            translation.activate(language)
            response = HttpResponse(status=200)
            response.set_cookie(translation.LANGUAGE_SESSION_KEY, language)
            return response
    raise HttpResponseNotAllowed
