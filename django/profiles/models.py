import logging

from django.db import models
from django.contrib.auth.models import User
from django.contrib.staticfiles.templatetags.staticfiles import static

from core.models import BaseModel
from core.mixins import ImageMixin

logger = logging.getLogger('app')


class ProfileException(Exception):
    pass


class Profile(ImageMixin, BaseModel, models.Model):

    user = models.OneToOneField(
        User,
        on_delete=models.CASCADE,
        primary_key=True,
        related_name='profile',
    )

    def __str__(self):
        return self.user.email

    def as_dict(self):
        if self.image:
            image_url = self.image.url
        else:
            image_url = static('img/user.png')
        return {'id': self.user.id, 'email': self.user.email, 'image': image_url}

    @staticmethod
    def get_logged(request):
        if not request.user.is_authenticated:
            return None
        try:
            if not request.user.profile:
                profile = Profile(user=request.user)
                profile.save()
            return request.user.profile
        except Exception as e:
            logger.error(e)
        raise ProfileException('Can\'t create user profile')

    @staticmethod
    def get_or_create(email, password):
        try:
            user = User.objects.get(email=email)
        except User.DoesNotExist:
            user = User.objects.create_user(email, email, password)
            user.save()
            profile = Profile(user=user)
            profile.save()
        if user.check_password(password):
            return user.profile
        raise ProfileException('Invalid password')
