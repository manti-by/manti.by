from django.http import JsonResponse
from simple_rest import Resource

from api.utils import resource_wrapper
from profiles.models import Profile


class ApiResource(Resource):

    @resource_wrapper
    def get(self, request):
        if request.GET.get('latest'):
            latest = Profile.objects.all().order_by('-created')
            if latest.count():
                data = latest[0].as_dict()
            else:
                return JsonResponse({'status': 204,
                                     'message': 'No data'}, status=200)
        else:
            data = []
            for s in Profile.objects.all()[:20]:
                data.append(s.as_dict())
        return JsonResponse({'status': 200,
                             'data': data}, status=200)