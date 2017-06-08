"""API URL Configuration"""

from django.conf.urls import url, include

from rest_framework import routers

from . import views

router = routers.DefaultRouter()
router.register(r'sms', views.SMSView.as_view(), 'sms')

# Wire up our API using automatic URL routing.
# Additionally, we include login URLs for the browsable API.
urlpatterns = [
    url(r'^sms', include(router.urls)),
]
