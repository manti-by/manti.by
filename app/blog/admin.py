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
        models.TextField: {'widget': Textarea(attrs={'rows': 4, 'cols': 80})},
    }

    list_display = ('thumb_image', 'name', 'is_music', 'catnum', 'is_ready', 'created')

    fieldsets = (
        (_('Base Info'), {
            'fields': ('name_ru', 'name_en', 'slug')
        }),
        (_('Meta Description'), {
            'fields': ('meta_ru', 'meta_en')
        }),
        (_('Summary'), {
            'fields': ('summary_ru', 'summary_en')
        }),
        (_('Description'), {
            'fields': ('description_ru', 'description_en')
        }),
        (_('Tags'), {
            'fields': ('genre', 'tags')
        }),
        (_('Music params'), {
            'classes': ('collapse',),
            'fields': ('is_music', 'catnum', 'genre', 'quality', 'length', 'tracklist')
        }),
        (_('Files'), {
            'classes': ('collapse',),
            'fields': ('cover', 'release', 'mp3_preview_ready', 'ogg_preview_ready', 'ogg_release_ready'),
        })
    )

    def get_queryset(self, request):
        return super(PostAdmin, self).get_queryset(request).prefetch_related('genre', 'tags')

    def thumb_image(self, obj):
        image = static_file('img/no-image.png')
        if obj.cover:
            image = obj.cover.url
        return mark_safe('<img src="%s" width="50" />' % image)
    thumb_image.short_description = _('Image')

    def is_ready(self, obj):
        return obj.ready
    is_ready.boolean = True
    is_ready.short_description = _('Ready')
