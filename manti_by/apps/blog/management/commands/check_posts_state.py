import os
import logging

from django.core.management.base import BaseCommand

from manti_by.apps.blog.models import Post

logger = logging.getLogger(__name__)


class Command(BaseCommand):
    help = "Check posts state"

    def handle(self, *args, **options):
        checked = 0
        for post in Post.objects.all():
            try:
                post.ogg_release_ready = (
                    os.path.exists(post.release_ogg_file)
                    and os.path.getsize(post.release_ogg_file) > 0
                )

                post.mp3_preview_ready = (
                    os.path.exists(post.preview_mp3_file)
                    and os.path.getsize(post.preview_mp3_file) > 0
                )

                post.ogg_preview_ready = (
                    os.path.exists(post.preview_ogg_file)
                    and os.path.getsize(post.preview_ogg_file) > 0
                )

                self.stdout.write(
                    "Checked post #%d: %d %d %d"
                    % (
                        post.id,
                        1 if post.ogg_release_ready else 0,
                        1 if post.mp3_preview_ready else 0,
                        1 if post.ogg_preview_ready else 0,
                    )
                )

                post.save()
                checked += 1
            except Exception as e:
                logger.error(e)

        self.stdout.write("Checked %d posts" % checked)
