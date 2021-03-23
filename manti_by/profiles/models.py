from django.db import models
from django.contrib.auth.models import User
from django.templatetags.static import static
from django.utils.translation import gettext_lazy as _

from manti_by.core.models import BaseModel
from manti_by.core.utils import profile_image_name


class Profile(BaseModel):

    original_image = models.ImageField(
        upload_to=profile_image_name,
        blank=True,
        null=True,
        verbose_name=_("Profile Image"),
    )

    user = models.OneToOneField(
        User, on_delete=models.CASCADE, primary_key=True, related_name="profile"
    )

    def __str__(self):
        return self.user.email

    @property
    def image(self):
        if self.original_image:
            return self.original_image.url
        return static("img/no-image.png")
