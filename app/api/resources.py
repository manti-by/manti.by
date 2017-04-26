import json

from django.http import JsonResponse
from simple_rest import Resource

from api.utils import resource_wrapper
from gallery.models import Gallery, Image


class OrderableResource(Resource):

    @resource_wrapper
    def post(self, request):
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
                        item['result'] = 'Updated'
                    except Exception as e:
                        item['result'] = e
                return JsonResponse({'status': 200, 'data': data}, status=200)
        except Exception as e:
            pass
        return JsonResponse({'status': 204,
                             'message': 'No data'}, status=200)