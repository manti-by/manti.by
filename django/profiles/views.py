import logging

from django.http import Http404
from django.shortcuts import render, redirect
from django.contrib.auth import login, logout

from profiles.models import ProfileException, Profile

logger = logging.getLogger('app')


def profile_page(request):
    try:
        if not request.user.is_authenticated:
            raise Http404
        profile = Profile.get_logged(request)
        if request.method == 'POST':
            profile.email = request.POST.get('email', request.user.email)
            profile.image = request.FILES.get('image')
            profile.save()
        return render(request, 'profiles/profile.html', {'profile': profile.as_dict()})
    except ProfileException as e:
        logger.error(e)
        return render(request, 'profiles/profile.html', {'error': e})
    except Exception as e:
        logger.error(e)
        raise Http404


def login_page(request):
    try:
        if request.user.is_authenticated:
            return redirect('index')

        if request.method == 'POST':
            if not request.POST.get('email') or not request.POST.get('password'):
                return render(request, 'profiles/login.html',
                              {'error': 'Please fill email and password fields'})

            profile = Profile.get_or_create(request.POST.get('email'),
                                            request.POST.get('password'))
            if not profile:
                return render(request, 'profiles/login.html',
                              {'error': 'Invalid password'})
            else:
                login(request, profile.user)
                return redirect('index')

        return render(request, 'profiles/login.html')
    except ProfileException as e:
        logger.error(e)
        return render(request, 'profiles/login.html', {'error': e})
    except Exception as e:
        logger.error(e)
        raise Http404


def logout_page(request):
    logout(request)
    return redirect('index')
