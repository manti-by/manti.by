import logging

from django.conf import settings
from django.core.mail import send_mail
from django.core.management.base import BaseCommand
from django.template.loader import render_to_string

from manti_by.core.models import Email

logger = logging.getLogger(__name__)


class Command(BaseCommand):
    def handle(self, *args, **options):
        for email in Email.objects.filter(is_sent=False):
            try:
                text_content = render_to_string("emails/email.txt", {"email": email})
                html_content = render_to_string("emails/email.html", {"email": email})

                send_mail(
                    email.subject,
                    text_content,
                    email.email,
                    (settings.CONTACT_EMAIL,),
                    html_message=html_content,
                )
                email.is_sent = True
                email.save()
            except Exception as e:
                logger.error(e)
