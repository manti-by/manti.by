import logging
import subprocess  # nosec

from manti_by.apps.blog.constants import MP3_PREVIEW, MP3_RELEASE, OGG_PREVIEW, OGG_RELEASE

logger = logging.getLogger(__name__)


def convert_release(ffmpeg_format, post_id, output_type=""):
    from manti_by.apps.blog.models import Post

    try:
        post = Post.objects.get(id=post_id)
    except Post.DoesNotExist as e:
        logger.error(e)
        return -1

    if output_type == OGG_RELEASE:
        if post.release.file.name == post.release_ogg_file:
            return 0
        result_file_name = post.release_ogg_file
        update_attribute = "ogg_release_ready"
    elif output_type == MP3_RELEASE:
        if post.release.file.name == post.release_mp3_file:
            return 0
        result_file_name = post.release_mp3_file
        update_attribute = "mp3_release_ready"
    elif output_type == OGG_PREVIEW:
        result_file_name = post.preview_ogg_file
        update_attribute = "ogg_preview_ready"
    elif output_type == MP3_PREVIEW:
        result_file_name = post.preview_mp3_file
        update_attribute = "mp3_preview_ready"
    else:
        logger.error(f"Invalid conversion format {output_type}")
        return -1

    ffmpeg_format.append(result_file_name)
    command = ["ffmpeg", "-y", "-i", post.release.file.name] + ffmpeg_format
    command_exit_code = subprocess.call(command, shell=False)  # nosec
    if command_exit_code == 0:
        setattr(post, update_attribute, True)
        post.save()
    return command_exit_code


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
