import logging

from django.http import Http404
from django.contrib.auth.models import User
from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout

from profiles.models import Profile

logger = logging.getLogger('app')


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
        logger.error(e)
        raise Http404


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
    except User.DoesNotExist as e:
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
        logger.error(e)
        raise Http404

    return render(request, 'profiles/login.html', data)


def logout_page(request):
    logout(request)
    return redirect('index')
