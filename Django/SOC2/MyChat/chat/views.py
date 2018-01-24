from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from .models import Room


@login_required
def index(request):
    """
    Root page view. This is essentially a single-page app, if you ignore the
    login and admin parts.
    """
    rooms = Room.objects.order_by("title")

    return render(request, "index.html", {
        "rooms": rooms,
    })