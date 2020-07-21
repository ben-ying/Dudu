from django.http import HttpResponse
from django.urls import reverse

from rest_framework.decorators import api_view
from rest_framework.response import Response



@api_view(['GET'])
def api_root(request, format=None):
    return Response({
        'exchange': reverse('tools:query-exchange-rate'),
    })


