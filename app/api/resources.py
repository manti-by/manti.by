import json
import logging

from django.http import JsonResponse
from django.utils.translation import ugettext_lazy as _
from simple_rest import Resource

from api.utils import resource_wrapper
from core.models import Email
from blog.models import Post
from gallery.models import Gallery, Image

logger = logging.getLogger('app')


class OrderableResource(Resource):

    @resource_wrapper
    def post(self, request):
        if not request.user.is_superuser:
            return JsonResponse({'status': 403,
                                 'message': _('Forbidden')}, status=200)
        try:
            object_type = request.POST.get('type', 'image').strip()
            data = json.loads(request.POST.get('data'))
            if len(data):
                for item in data:
                    try:
                        if object_type == 'gallery':
                            obj = Gallery.objects.get(pk=item['id'])
                        else:
                            obj = Image.objects.get(pk=item['id'])
                        obj.order = item['order']
                        obj.save()
                        item['result'] = _('Updated')
                    except Exception as e:
                        item['result'] = e
                return JsonResponse({'status': 200, 'data': data}, status=200)
        except Exception as e:
            pass
        return JsonResponse({'status': 204,
                             'message': _('No data')}, status=200)


class ContactResource(Resource):

    @resource_wrapper
    def post(self, request):
        try:
            meta = {}
            for item in ['HTTP_ACCEPT_LANGUAGE', 'HTTP_REFERER', 'HTTP_USER_AGENT']:
                meta[item] = request.META.get(item)

            e = Email(name=request.POST.get('name'),
                      email=request.POST.get('email'),
                      subject=_('Contact request from manti.by'),
                      message=request.POST.get('message'),
                      meta=json.dumps({'cookies': request.COOKIES, 'meta': meta}))
            e.save()
            return JsonResponse({'status': 200,
                                 'message': _('Thanks for subscribing, we\'ll get in touch soon')}, status=200)
        except Exception as e:
            logger.error(e.message)
            return JsonResponse({'status': 500,
                                 'message': _('Can\'t save contact info, please try later')}, status=200)


class PostResource(Resource):

    @resource_wrapper
    def get(self, request):
        start = int(request.GET.get('start', 0))
        limit = int(request.GET.get('limit', 100))
        is_music = bool(request.GET.get('is_music', True))
        return_type = request.GET.get('type', 'json')
        try:
            result = []
            posts = Post.objects.ordered().filter(is_music=is_music)[start:start+limit]
            for p in posts:
                if return_type == 'html':
                    result.append(p.as_html())
                else:
                    result.append(p.as_dict())

            return JsonResponse({'status': 200,
                                 'data': result}, status=200)
        except Exception as e:
            logger.error(e.message)
            return JsonResponse({'status': 500,
                                 'message': _('Can\'t load posts, please try later')}, status=200)