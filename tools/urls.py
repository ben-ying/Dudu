from django.urls import include
from django.urls import path

from tools.views.views import api_root
from tools.views.exchange_views import ExchangeViewSet
from tools.views.exchange_views import CurrencyViewSet



api_query_exchange_rate = ExchangeViewSet.as_view({
    'get': 'list',    
})

api_query_currency_list = CurrencyViewSet.as_view({
    'get': 'list',    
})

app_name = 'tools'
api_urlpatterns = [
    path('', api_root, name='api-root'),
    path('exchange/', api_query_exchange_rate, name='query-exchange-rate'),
    path('currencies/', api_query_currency_list, name='query-currency-list'),
]

urlpatterns = [
    path('api/', include(api_urlpatterns)),
]
