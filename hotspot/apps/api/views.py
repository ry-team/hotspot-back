from rest_framework.decorators import list_route
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.viewsets import ViewSetMixin


class SMSView(ViewSetMixin, APIView):
    @list_route(methods=('post',))
    def send(self, request):
        phone_number = request.data.get('number')
        internet_type = request.data.get('type')

        if not phone_number:
            return Response({'status': 'error', 'msg': 'Invalid number'})

        if internet_type not in ['0', '1']:
            return Response({'status': 'error', 'msg': 'Invalid type'})

        return Response({'status': 'success'})


    @list_route(methods=('post',))
    def check(self, request):
        phone_number = request.data.get('number')
        code = request.data.get('code')

        if not phone_number:
            return Response({'status': 'error', 'msg': 'Invalid number'})

        if code != '0':
            return Response({'status': 'error', 'msg': 'Invalid code'})

        return Response({'status': 'success'})
