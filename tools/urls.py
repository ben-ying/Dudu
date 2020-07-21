from django.urls import include
from django.urls import path

from tools.views.views import api_root
from tools.views.exchange_views import ExchangeViewSet



api_query_exchange_rate_detail = ExchangeViewSet.as_view({
    'get': 'list',    
})

app_name = 'tools'
api_urlpatterns = [
    path('', api_root, name='api-root'),
    path('exchange', api_query_exchange_rate_detail, name='query-exchange-rate'),
]

urlpatterns = [
    path('api/', include(api_urlpatterns)),
]
