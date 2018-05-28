import os

from celery import Celery


app = Celery()


@app.on_after_configure.connect
def setup_periodic_tasks(sender, **kwargs):
    sender.add_periodic_task(600.0, check_posts_state.s(),
                             name='Check Posts state every 10 minutes')


@app.task
def check_posts_state():
    from blog.models import Post
    for post in Post.objects.all():
        post.ogg_release_ready = os.path.exists(post.release_ogg_file) \
            and os.path.getsize(post.release_ogg_file) > 0

        post.mp3_preview_ready = os.path.exists(post.preview_mp3_file) \
            and os.path.getsize(post.preview_mp3_file) > 0

        post.ogg_preview_ready = os.path.exists(post.preview_ogg_file) \
            and os.path.getsize(post.preview_ogg_file) > 0

        post.save()


@app.task
def convert_to_mp3_preview(post_id):
    from blog.models import MP3_PREVIEW
    from blog.utils import convert_release

    command = ['-acodec', 'libmp3lame', '-t', '1800', '-ac', '1', '-ab', '96k',
               '-ar', '44100', '-af', '"afade=t=out:st=1770:d=30"']
    convert_release(command, post_id, MP3_PREVIEW)


@app.task
def convert_to_ogg_preview(post_id):
    from blog.models import OGG_PREVIEW
    from blog.utils import convert_release

    command = ['-acodec', 'libvorbis', '-t', '1800', '-ac', '1', '-ab', '96k',
               '-af', '"afade=t=out:st=1770:d=30"']
    convert_release(command, post_id, OGG_PREVIEW)


@app.task
def convert_to_ogg_release(post_id):
    from blog.models import OGG_RELEASE
    from blog.utils import convert_release

    command = ['-acodec', 'libvorbis', '-ab', '320k']
    convert_release(command, post_id, OGG_RELEASE)
