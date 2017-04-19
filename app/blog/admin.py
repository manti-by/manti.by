from django.db import models
from django.forms import Textarea

from django.contrib import admin
from django.contrib.staticfiles.templatetags.staticfiles import static as static_file
from django.utils.safestring import mark_safe
from django.utils.translation import ugettext_lazy as _

from blog.models import Post


@admin.register(Post)
class PostAdmin(admin.ModelAdmin):

    formfield_overrides = {
        models.TextField: {'widget': Textarea(attrs={'rows': 4, 'cols': 20})},
    }

    list_display = ('thumb_image', 'title', 'is_music', 'catnum', 'genre', 'ready', 'created')

    fieldsets = (
        (_('Info'), {
            'fields': ('title', 'slug', 'meta', 'summary', 'description')
        }),
        (_('Music params'), {
            'classes': ('grp-collapse grp-closed',),
            'fields': ('is_music', 'catnum', 'genre', 'quality', 'length', 'tracklist')
        }),
        (_('Files'), {
            'classes': ('grp-collapse grp-closed',),
            'fields': ('cover', 'release', 'mp3_preview_ready', 'ogg_preview_ready', 'ogg_release_ready'),
        })
    )

    def thumb_image(self, obj):
        image = static_file('img/no-image.png')
        if obj.cover:
            image = obj.cover.url
        return mark_safe('<img src="%s" width="50" />' % image)
    thumb_image.short_description = _('Image')