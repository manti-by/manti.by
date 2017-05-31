from __future__ import unicode_literals

from datetime import datetime

from django.db import models
from django.utils import timezone
from django.utils.translation import ugettext_lazy as _

from core.utils import utc


class BaseModel(models.Model):

    created = models.DateTimeField(default=timezone.now, verbose_name=_('Created, UTC'))

    @property
    def human_date(self):
        delta = datetime.now(utc) - self.created
        if delta.total_seconds() < 60 * 60:
            return 'just now'
        elif delta.total_seconds() < 60 * 60 * 5:
            return '%sh ago' % str(int(delta.total_seconds() / (60 * 60)))
        elif delta.total_seconds() < 60 * 60 * 24:
            return 'today'
        elif delta.total_seconds() < 60 * 60 * 24 * 7:
            return '%sd ago' % str(int(delta.total_seconds() / (60 * 60 * 24)))
        else:
            return self.created.strftime('%d %b %Y')

    class Meta:
        abstract = True


class Email(BaseModel, models.Model):

    name = models.CharField(max_length=255, blank=True, null=True)
    email = models.EmailField()
    subject = models.CharField(max_length=255)
    message = models.TextField()
    meta = models.TextField(blank=True, null=True)
    is_sent = models.BooleanField(blank=True, default=False)
