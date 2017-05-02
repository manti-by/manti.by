from __future__ import unicode_literals

import os
import csv
import logging

from django.conf import settings
from django.core.management.base import BaseCommand

from blog.models import Post

logger = logging.getLogger('app')


class Command(BaseCommand):
    help = 'Import posts from old site'

    def handle(self, *args, **options):
        relations = []
        file_path = os.path.join(settings.BASE_DIR, '..', 'docs', 'Posts.csv')

        # Read and process CSV data
        with open(file_path, mode='rU') as file_handler:
            for p in csv.reader(file_handler):
                relations.append({'original_id': p[0], 'relations': p[15]})
                try:
                    post = Post(original_id=p[0],  # old id
                                name=p[2],  # name
                                slug=p[1],  # alias
                                meta=p[6],  # metadesc
                                summary=p[3],  # teaser
                                description=p[4],  # description
                                is_music=p[7],  # is_music
                                catnum=p[8],  # catnum
                                genre=p[9],  # genre
                                length=p[10], # length
                                quality=p[11],  # quality
                                tracklist=p[12],  # tracklist
                                tags=p[5],  # metakeys
                                viewed=p[17],  # viewed
                                created=p[16])  # created
                    post.cover.file = p[13]  # cover
                    post.release.file = p[14]  # release
                    post.save()
                except Exception as e:
                    logger.error(e)

        # Update relations
        for r in relations:
            original = Post.objects.get(original_id=r['original_id'])
            for p in Post.objects.filter(original_id__in=r['relations'].split()):
                try:
                    original.related.add(p)
                except Exception as e:
                    logger.error(e)
