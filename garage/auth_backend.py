from django.contrib.auth.backends import BaseBackend
from django.contrib.auth.hashers import check_password
from .models import Utente


class UtenteBackend(BaseBackend):
    def authenticate(self, request, username=None, password=None, **kwargs):
        try:
            utente = Utente.objects.get(email=username)
        except Utente.DoesNotExist:
            return None

        if check_password(password, utente.password):
            return utente

        return None

    def get_user(self, user_id):
        try:
            return Utente.objects.get(pk=user_id)
        except Utente.DoesNotExist:
            return None