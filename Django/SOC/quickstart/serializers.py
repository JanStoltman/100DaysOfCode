from rest_framework import serializers

from quickstart.models import Attendee, Place, Event


class PlaceSerializer(serializers.ModelSerializer):
    class Meta:
        model = Place
        fields = ('id', 'name', 'longitude', 'latitude')


class EventSerializer(serializers.ModelSerializer):
    place = PlaceSerializer()

    class Meta:
        model = Event
        fields = ('id', 'name', 'description', 'place', 'begins', 'ends')

    def create(self, validated_data):
        place_data = validated_data.pop('place')
        place, _ = Place.objects.update_or_create(**place_data)
        return Event.objects.create(place=place, **validated_data)

    def update(self, instance, validated_data):
        place_data = validated_data.pop('place')
        instance.place, _ = Place.objects.update_or_create(**place_data)
        instance.name = validated_data.pop('name')
        instance.description = validated_data.pop('description')
        instance.begins = validated_data.pop('begins')
        instance.ends = validated_data.pop('ends')

        instance.save()
        return instance


class AttendeeSerializer(serializers.ModelSerializer):
    events = EventSerializer(many=True, read_only=True)

    class Meta:
        model = Attendee
        fields = ('id', 'name', 'email', 'age', 'events')

        # def update(self, instance, validated_data):
        #     # Update the  instance
        #     events_data = validated_data.pop('events')
        #     instance.events, _ = Event.objects.update_or_create(many=True, **events_data)
        #
        #     return instance
