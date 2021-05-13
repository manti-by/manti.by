from django.contrib import admin

from manti_by.apps.shortener.models import Link


@admin.register(Link)
class LinkAdmin(admin.ModelAdmin):

    list_display = ("name", "link", "original_link", "created")
    ordering = ("-created",)
