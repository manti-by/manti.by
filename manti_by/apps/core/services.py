import logging
import subprocess

from manti_by.apps.blog.constants import MP3_PREVIEW, MP3_RELEASE, OGG_PREVIEW, OGG_RELEASE

logger = logging.getLogger(__name__)


def convert_release(ffmpeg_format, post_id, output_type=""):
    from manti_by.apps.blog.models import Post

    try:
        post = Post.objects.get(id=post_id)
    except Post.DoesNotExist as e:
        logger.warning(e)
        return

    if output_type == OGG_PREVIEW:
        result = post.preview_ogg_file
    elif output_type == OGG_RELEASE:
        result = post.release_ogg_file
    elif output_type == MP3_RELEASE:
        if post.release.file.name == post.release_mp3_file:
            return
        result = post.release_mp3_file
    else:
        result = post.preview_mp3_file

    ffmpeg_format.append(result)
    command = ["ffmpeg", "-y", "-nostats", "-i", post.release.file.name] + ffmpeg_format
    return subprocess.call(command)


def convert_to_mp3_preview(post_id):
    command = [
        "-acodec",
        "libmp3lame",
        "-t",
        "1800",
        "-ac",
        "1",
        "-ab",
        "96k",
        "-ar",
        "44100",
        "-af",
        "afade=t=out:st=1770:d=30",
    ]
    return convert_release(command, post_id, MP3_PREVIEW)


def convert_to_mp3_release(post_id):
    command = ["-acodec", "libmp3lame", "-ab", "320k"]
    return convert_release(command, post_id, MP3_RELEASE)


def convert_to_ogg_preview(post_id):
    command = [
        "-acodec",
        "libvorbis",
        "-t",
        "1800",
        "-ac",
        "1",
        "-ab",
        "96k",
        "-ar",
        "44100",
        "-af",
        "afade=t=out:st=1770:d=30",
    ]
    return convert_release(command, post_id, OGG_PREVIEW)


def convert_to_ogg_release(post_id):
    command = ["-acodec", "libvorbis", "-ab", "320k"]
    return convert_release(command, post_id, OGG_RELEASE)
