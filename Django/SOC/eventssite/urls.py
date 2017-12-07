"""eventssite URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin
from rest_framework import routers
from rest_framework.authtoken.views import obtain_auth_token
from rest_framework.documentation import include_docs_urls

from quickstart import views

router = routers.DefaultRouter()
router.register(r'^events', views.Events, 'Event')
router.register(r'^attendees', views.Attendees, 'Attendee')
router.register(r'^places', views.Places, 'Place')

urlpatterns = [
    url(r'^docs/', include_docs_urls(title='API documentation')),
    url(r'^admin/', admin.site.urls, name='admin'),
    url(r'^api-token-auth/', obtain_auth_token, name='auth-token'),
    url(r'^events/(?P<id>[0-9]+)/$', views.event_by_id, name='event-by-id'),
    url(r'^events/(?P<id>[0-9]+)/place/$', views.event_place_by_id, name='event-place-by-id'),
    url(r'^attendees/(?P<name>\w{1,50})/events/(?P<id>[0-9]+)/$', views.attendee_event_by_id_by_name, name='attendee-events-by-id -by-name'),
    url(r'^attendees/(?P<name>\w{1,50})/events/$', views.attendee_events_by_name, name='attendee-events-by-name'),
    url(r'^attendees/(?P<name>\w{1,50})/$', views.attendee_by_name, name='attendee-by-name')
]

urlpatterns += router.urls
