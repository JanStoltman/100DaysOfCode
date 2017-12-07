from django.db import models
from django.utils.datetime_safe import datetime


class Place(models.Model):
    objects = models.Manager()
    id = models.AutoField(primary_key=True)
    name = models.TextField(max_length=255, default="")
    longitude = models.FloatField(default=0.0)
    latitude = models.FloatField(default=0.0)


class Event(models.Model):
    objects = models.Manager()
    id = models.AutoField(primary_key=True)
    name = models.TextField(max_length=255)
    description = models.TextField(default="")
    begins = models.DateTimeField(default=datetime.now)
    ends = models.DateTimeField(default=datetime.now)
    place = models.ForeignKey(Place, on_delete=models.PROTECT, default=None, name='place')


class Attendee(models.Model):
    objects = models.Manager()
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=255, default="")
    age = models.IntegerField()
    email = models.CharField(max_length=255)
    events = models.ManyToManyField('Event')