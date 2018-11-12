import logging

from django.http import Http404
from django.contrib.auth.models import User
from django.shortcuts import render, redirect
from django.views.decorators.cache import cache_page
from django.contrib.auth import authenticate, login, logout
from raven.contrib.django.raven_compat.models import client

from profiles.models import Profile

logger = logging.getLogger()


@cache_page(60 * 60 * 24 * 5)
def profile_page(request):
    try:
        if not request.user.is_authenticated:
            return redirect('login')

        profile = request.user.profile
        if request.method == 'POST':
            profile.user.username = request.POST.get('username', request.user.username)
            profile.user.email = request.POST.get('email', request.user.email)
            profile.user.save()
            if request.FILES.get('image'):
                profile.original_image = request.FILES.get('image')
                profile.save()
        return render(request, 'profiles/profile.html', {'profile': profile})
    except Exception as e:
        client.captureException()
        logger.error(e)
        raise Http404


@cache_page(60 * 60 * 24 * 5)
def login_page(request):
    try:
        if request.user.is_authenticated:
            return redirect('profile')

        data = {}
        if request.method == 'POST':
            email = request.POST.get('email')
            password = request.POST.get('password')
            if not email or not password:
                return render(request, 'profiles/login.html',
                              {'error': 'Please fill email and password fields'})

            user = User.objects.get(email=email)
            user = authenticate(username=user.username, password=password)
            if user is not None:
                login(request, user)
                return redirect('profile')

            data = {'error': 'Invalid credentials, please check your email and password'}
    except User.DoesNotExist:
        client.captureException()

        email = request.POST.get('email')
        password = request.POST.get('password')
        username = email.split('@')[0]

        user = User.objects.create_user(email=email, username=username, password=password)
        profile = Profile(user=user)
        profile.save()

        user = authenticate(username=username, password=password)
        login(request, user)
        return redirect('profile')
    except Exception as e:
        client.captureException()
        logger.error(e)
        raise Http404

    return render(request, 'profiles/login.html', data)


@cache_page(60 * 60 * 24 * 5)
def logout_page(request):
    logout(request)
    return redirect('index')
