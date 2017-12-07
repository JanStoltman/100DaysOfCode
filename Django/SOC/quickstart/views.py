from django.contrib.auth.decorators import login_required
from django.db.models import ProtectedError
from rest_framework import status
from rest_framework import viewsets
from rest_framework.decorators import detail_route, api_view
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response

from quickstart.models import Place, Event, Attendee
from quickstart.permissions import IsAdminOrReadOnly
from quickstart.serializers import PlaceSerializer, EventSerializer, AttendeeSerializer


class Places(viewsets.ModelViewSet):
    """
    API endpoint that allows Places to be viewed or edited.
    """
    queryset = Place.objects.all()
    serializer_class = PlaceSerializer
    permission_classes = (IsAdminOrReadOnly,)


class Events(viewsets.ModelViewSet):
    """
    API endpoint that allows Events to be viewed or edited.
    """
    queryset = Event.objects.all()
    serializer_class = EventSerializer
    permission_classes = (IsAdminOrReadOnly,)


class Attendees(viewsets.ModelViewSet):
    """
    API endpoint that allows Attendees to be viewed or edited.
    """
    queryset = Attendee.objects.all()
    serializer_class = AttendeeSerializer
    permission_classes = (IsAuthenticated,)


@api_view(['GET', 'DELETE', 'PUT'])
def attendee_by_name(request, name=""):
    """
    API endpoint that allows to find, update and delete attendee by name
    """
    if request.user.is_authenticated:
        try:
            attendee = Attendee.objects.get(name=name)
        except Exception:
            return Response(status=status.HTTP_404_NOT_FOUND)

        if request.method == 'GET':
            serializer = AttendeeSerializer(attendee)
            return Response(serializer.data)

        elif request.method == 'DELETE':
            attendee.delete()
            return Response(status=status.HTTP_204_NO_CONTENT)

        elif request.method == 'PUT':
            serializer = AttendeeSerializer(attendee, data=request.data)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data)

            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

        else:
            return Response(status=status.HTTP_405_METHOD_NOT_ALLOWED)

    else:
        return Response(status=status.HTTP_401_UNAUTHORIZED)


@api_view(['GET', 'POST'])
def attendee_events_by_name(request, name=""):
    try:
        attendee = Attendee.objects.get(name=name)
    except Exception:
        return Response(status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        serializer = EventSerializer(attendee.events, many=True)
        return Response(serializer.data)

    elif request.method == 'POST':
        serializer = EventSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            event = Event.objects.get(id=serializer.data['id'])
            attendee.events.add(event)
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    else:
        return Response(status=status.HTTP_405_METHOD_NOT_ALLOWED)


@api_view(['GET', 'DELETE'])
def attendee_event_by_id_by_name(request, name="",id=-1):
    try:
        attendee = Attendee.objects.get(name=name)
        event = Event.objects.get(id=id)
    except Exception:
        return Response(status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        serializer = EventSerializer(event)
        return Response(serializer.data)

    elif request.method == 'DELETE':
        attendee.events.remove(event)
        serializer = AttendeeSerializer(attendee)
        return Response(serializer.data,status=status.HTTP_200_OK)

    else:
        return Response(status=status.HTTP_405_METHOD_NOT_ALLOWED)


@api_view(['GET', 'DELETE', 'PUT'])
def event_by_id(request, id=-1):
    try:
        event = Event.objects.get(id=id)
    except Exception:
        return Response(status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        serializer = EventSerializer(event)
        return Response(serializer.data)

    elif request.method == 'DELETE':
        event.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

    elif request.method == 'PUT':
        serializer = EventSerializer(event, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    else:
        return Response(status=status.HTTP_405_METHOD_NOT_ALLOWED)


@api_view(['GET', 'PUT'])
def event_place_by_id(request, id=-1):
    try:
        event = Event.objects.get(id=id)
    except Exception:
        return Response(status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        serializer = PlaceSerializer(event.place)
        return Response(serializer.data)

    elif request.method == 'PUT':
        serializer = PlaceSerializer(event.place, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    else:
        return Response(status=status.HTTP_405_METHOD_NOT_ALLOWED)


@api_view(['GET', 'DELETE', 'PUT'])
def place_by_id(request, id=-1):
    try:
        place = Place.objects.get(id=id)
    except Exception:
        return Response(status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        serializer = PlaceSerializer(place)
        return Response(serializer.data)

    elif request.method == 'DELETE':
        try:
            place.delete()
        except ProtectedError:
            return Response(status=status.HTTP_406_NOT_ACCEPTABLE)

        return Response(status=status.HTTP_204_NO_CONTENT)

    elif request.method == 'PUT':
        serializer = PlaceSerializer(place, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    else:
        return Response(status=status.HTTP_405_METHOD_NOT_ALLOWED)
