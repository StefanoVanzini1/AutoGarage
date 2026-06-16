from django import forms
from .models import Utente


class RegistrazioneClienteForm(forms.ModelForm):
    password = forms.CharField(widget=forms.PasswordInput)

    class Meta:
        model = Utente
        fields = ["nome", "cognome", "email", "password", "telefono", "codice_fiscale"]

    def save(self, commit=True):
        utente = super().save(commit=False)
        utente.ruolo = "cliente"
        if commit:
            utente.save()
        return utente


class LoginForm(forms.Form):
    email = forms.EmailField()
    password = forms.CharField(widget=forms.PasswordInput)