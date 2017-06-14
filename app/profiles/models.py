from django.db import models
from django.contrib.auth.models import User
from django.contrib.staticfiles.templatetags.staticfiles import static
from django.utils.translation import ugettext_lazy as _

from core.models import BaseModel
from core.utils import profile_image_name


class ProfileException(Exception):
    pass


class Profile(BaseModel, models.Model):

    original_image = models.ImageField(upload_to=profile_image_name, blank=True, null=True,
                                       verbose_name=_('Profile Image'))

    user = models.OneToOneField(
        User,
        on_delete=models.CASCADE,
        primary_key=True,
        related_name='profile',
    )

    def __str__(self):
        return self.user.email

    @property
    def image(self):
        if self.image:
            return self.original_image.url
        return static('img/user.png')

    def as_dict(self):
        return {'id': self.user.id,
                'email': self.user.email,
                'image': self.image}
