from modeltranslation.translator import translator, TranslationOptions
from gallery.models import Gallery


class GalleryTranslationOptions(TranslationOptions):
    fields = ("name",)


translator.register(Gallery, GalleryTranslationOptions)
