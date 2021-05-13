import os
import csv
import logging

from django.conf import settings
from django.utils.dateparse import parse_datetime
from django.utils.timezone import is_aware, make_aware
from django.core.management.base import BaseCommand

from manti_by.apps.blog.models import Post

logger = logging.getLogger(__name__)


class Command(BaseCommand):
    help = "Import posts from old site"

    def add_arguments(self, parser):
        parser.add_argument(
            "-d",
            "--delete",
            action="store_true",
            dest="delete",
            default=False,
            help="Delete all posts before import",
        )

    def handle(self, *args, **options):
        relations = []
        created = related = 0
        file_path = os.path.join(settings.BASE_DIR, "..", "docs", "posts.csv")

        # Clean DB
        if options["delete"]:
            Post.objects.all().delete()

        # Read and process CSV data
        with open(file_path, mode="rU") as file_handler:
            for p in csv.reader(file_handler):
                if not bool(p[7]):
                    continue

                relations.append({"original_id": p[0], "relations": p[15]})
                try:
                    date = parse_datetime(p[16])
                    if not is_aware(date):
                        date = make_aware(date)

                    # Create post
                    post = Post(
                        original_id=p[0],
                        name=p[2],
                        slug=p[1],
                        meta=p[6],
                        summary=p[3],
                        description=p[4],
                        is_music=True,
                        catnum=p[8],
                        length=p[10],
                        quality=p[11],
                        tracklist=p[12],
                        viewed=p[17],
                        created=date,
                    )
                    post.cover.name = p[14].replace("./content/", "")
                    post.release.name = p[13].replace("./content/", "")
                    post.save()

                    # Update tags
                    for g in p[9].split(","):
                        post.genre.add(g.strip())
                    for t in p[5].split(","):
                        post.tags.add(t.strip())

                    created += 1
                except Exception as e:
                    logger.error(e)

        # Update relations
        for r in relations:
            original = Post.objects.get(original_id=r["original_id"])
            if r["relations"]:
                for p in Post.objects.filter(original_id__in=r["relations"].split(",")):
                    try:
                        original.related.add(p)
                        related += 1
                    except Exception as e:
                        logger.error(e)

        self.stdout.write("Created %d posts, relations %d" % (created, related))
