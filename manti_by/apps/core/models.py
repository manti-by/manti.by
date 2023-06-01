from django.db import models
from django.utils.timezone import now
from django.utils.translation import gettext_lazy as _


class BaseModel(models.Model):
    created = models.DateTimeField(auto_now_add=True, verbose_name=_("Created, UTC"))
    updated = models.DateTimeField(auto_now=True, verbose_name=_("Updated, UTC"))

    @property
    def human_date(self):
        delta = now() - self.created
        if delta.total_seconds() < 60 * 60:
            return "just now"
        elif delta.total_seconds() < 60 * 60 * 5:
            return "%sh ago" % str(int(delta.total_seconds() / (60 * 60)))
        elif delta.total_seconds() < 60 * 60 * 24:
            return "today"
        elif delta.total_seconds() < 60 * 60 * 24 * 7:
            return "%sd ago" % str(int(delta.total_seconds() / (60 * 60 * 24)))
        else:
            return self.created.strftime("%d %b %Y")

    class Meta:
        abstract = True
