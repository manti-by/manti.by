from django.contrib import admin
from django.utils.safestring import mark_safe
from django.utils.translation import ugettext_lazy as _
from django.contrib.staticfiles.templatetags.staticfiles import static as static_file

from gallery.models import Gallery, Image


@admin.register(Gallery)
class GalleryAdmin(admin.ModelAdmin):

    list_display = ('name', 'order', 'images_count', 'created')
    ordering = ('order',)

    def images_count(self, obj):
        return obj.images.count()
    images_count.short_description = _('Images count')

    class Media:
        js = ('js/libs/jquery-ui-1.12.1/jquery-ui.js',
              'js/admin/orderable.js')
        css = {
             'all': ('css/admin/orderable.css',)
        }


@admin.register(Image)
class ImageAdmin(admin.ModelAdmin):

    list_display = ('image', 'gallery', 'order', 'is_ready', 'created')
    list_filter = ('gallery',)
    ordering = ('order',)

    fieldsets = (
        (_('Info'), {
            'fields': ('gallery', 'tags')
        }),
        (_('Files'), {
            'classes': ('collapse',),
            'fields': ('original_image', 'thumbnail_image', 'preview_image', 'gallery_image')
        }),
        (_('Other'), {
            'classes': ('collapse',),
            'fields': ('phash', 'order', 'created'),
        })
    )

    def image(self, obj):
        image = static_file('img/no-image.png')
        if obj.thumbnail_image:
            image = obj.thumbnail_image.url
        return mark_safe('<img src="%s" width="50" />' % image)
    image.short_description = _('Image')

    def is_ready(self, obj):
        return obj.ready
    is_ready.boolean = True
    is_ready.short_description = _('Ready')

    class Media:
        js = ('js/libs/jquery-ui-1.12.1/jquery-ui.js',
              'js/admin/orderable.js')
        css = {
             'all': ('css/admin/orderable.css',)
        }
