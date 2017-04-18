from __future__ import unicode_literals

import subprocess

from celery.task import task


def convert(command, post_id, is_preview=False, is_ogg=False):
    from blog.models import Post
    post = Post.objects.get(pk=post_id)
    result = filename = str(post.release.file)
    if is_preview:
        result = result.replace('release', 'preview')
    if is_ogg:
        result = result.replace('mp3', 'ogg')
    subprocess.call(command % (filename, result), shell=True)
    post.converted += 1
    post.save()


@task
def convert_to_mp3_preview(post_id):
    command = 'ffmpeg -y -i %s -acodec libmp3lame -t 1800 -ac 1 -ab 96k -ar 44100 -af "afade=t=out:st=1770:d=30" %s'
    convert(command, post_id, True, False)


@task
def convert_to_ogg_preview(post_id):
    command = 'ffmpeg -y -i %s -acodec libvorbis -t 1800 -ac 1 -ab 96k -af "afade=t=out:st=1770:d=30" %s'
    convert(command, post_id, True, True)


@task
def convert_to_ogg_release(post_id):
    command = 'ffmpeg -y -i %s -acodec libvorbis -ab 320k %s'
    convert(command, post_id, False, True)
