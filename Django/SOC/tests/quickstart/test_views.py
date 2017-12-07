from django.contrib.auth import get_user_model
from rest_framework import status
from rest_framework.authtoken.models import Token
from rest_framework.test import APITestCase


class GETTest(APITestCase):
    def setUp(self):
        self.tokenTest = 'Token 8ecc09408a891276e64b380119a8fa2a71d13409'
        self.user = get_user_model().objects.create_user(
            'test',
            'test@test.com',
            'test1234',
        )
        self.token = Token.objects.create(user=self.user)

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
        response = self.client.get('/events/5/place/')
        self.assertEqual(response.status_code, status.HTTP_403_FORBIDDEN)

    def test_attendees_by_name(self):
        self.client.force_authenticate(user=self.user)
        response = self.client.get('/attendees/j/')
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

    def test_attendees_events_by_name(self):
        response = self.client.get('/attendees/j/events/')
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

    def test_attendees_event_by_id_by_name(self):
        response = self.client.get('/attendees/j/events/5/')
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)




