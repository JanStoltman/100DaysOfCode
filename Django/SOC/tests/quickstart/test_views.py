from django.contrib.auth import get_user_model
from django.test import Client
from rest_framework import status
from rest_framework.test import APITestCase, APIClient


class GETTest(APITestCase):
    def setUp(self):
        self.user = get_user_model().objects.create_user(
            'test',
            'test@test.com',
            'test',
        )

    def test_can_get_place_list(self):
        response = self.client.get('/places/')
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_can_get_event_list(self):
        response = self.client.get('/events/')
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_can_get_attendee_list(self):
        self.client.force_authenticate(user=self.user)
        response = self.client.get('/attendees/')
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_event_by_i(self):
        self.client.force_authenticate(user=self.user)
        response = self.client.get('/events/-2/')
        self.assertEqual(response.status_code, status.HTTP_404_NOT_FOUND)

    def test_event_places_by_id(self):
        self.client.force_authenticate(user=self.user)
        response = self.client.get('/events/0/place/')
        self.assertEqual(response.status_code,status.HTTP_200_OK)

