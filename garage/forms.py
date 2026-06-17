import re
from django import forms
from .models import Utente, TestDrive


class RegistrazioneClienteForm(forms.ModelForm):
    password = forms.CharField(widget=forms.PasswordInput)
    conferma_password = forms.CharField(widget=forms.PasswordInput)

    class Meta:
        model = Utente
        fields = [
            "nome",
            "cognome",
            "email",
            "password",
            "conferma_password",
            "telefono",
            "codice_fiscale",
        ]

    def clean_password(self):
        password = self.cleaned_data.get("password")

        nome = self.cleaned_data.get("nome", "").lower()
        cognome = self.cleaned_data.get("cognome", "").lower()
        email = self.cleaned_data.get("email", "").lower()
        parte_email = email.split("@")[0]

        password_lower = password.lower()

        if len(password) < 8:
            raise forms.ValidationError("La password deve contenere almeno 8 caratteri.")

        if nome and nome in password_lower:
            raise forms.ValidationError("La password non può contenere il nome dell'utente.")

        if cognome and cognome in password_lower:
            raise forms.ValidationError("La password non può contenere il cognome dell'utente.")

        if parte_email and parte_email in password_lower:
            raise forms.ValidationError("La password non può contenere la parte iniziale dell'email.")

        if not re.search(r"[A-Z]", password):
            raise forms.ValidationError("La password deve contenere almeno una lettera maiuscola.")

        if not re.search(r"[a-z]", password):
            raise forms.ValidationError("La password deve contenere almeno una lettera minuscola.")

        if not re.search(r"\d", password):
            raise forms.ValidationError("La password deve contenere almeno un numero.")

        if not re.search(r"[^\w\s]", password):
            raise forms.ValidationError("La password deve contenere almeno un carattere speciale.")

        return password

    def clean(self):
        cleaned_data = super().clean()
        password = cleaned_data.get("password")
        conferma_password = cleaned_data.get("conferma_password")

        if password and conferma_password and password != conferma_password:
            raise forms.ValidationError("Le password non coincidono.")

        return cleaned_data

    def save(self, commit=True):
        utente = super().save(commit=False)
        utente.ruolo = "cliente"
        if commit:
            utente.save()
        return utente


class LoginForm(forms.Form):
    email = forms.EmailField()
    password = forms.CharField(widget=forms.PasswordInput)


class TestDriveForm(forms.ModelForm):
    class Meta:
        model = TestDrive
        fields = ["data_test_drive"]
        widgets = {
            "data_test_drive": forms.DateInput(attrs={"type": "date"})
        }