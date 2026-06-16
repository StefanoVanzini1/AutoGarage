from django.shortcuts import render, redirect
from .forms import RegistrazioneClienteForm, LoginForm
from .models import Utente


def home(request):
    return redirect("login")


def registrazione(request):
    if request.method == "POST":
        form = RegistrazioneClienteForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect("login")
    else:
        form = RegistrazioneClienteForm()

    return render(request, "garage/registrazione.html", {"form": form})


def login_view(request):
    errore = None

    if request.method == "POST":
        form = LoginForm(request.POST)

        if form.is_valid():
            email = form.cleaned_data["email"]
            password = form.cleaned_data["password"]

            try:
                utente = Utente.objects.get(email=email, password=password)

                request.session["utente_id"] = utente.id
                request.session["utente_nome"] = utente.nome
                request.session["utente_ruolo"] = utente.ruolo

                return redirect("catalogo")

            except Utente.DoesNotExist:
                errore = "Email o password non corrette."
    else:
        form = LoginForm()

    return render(request, "garage/login.html", {"form": form, "errore": errore})


def logout_view(request):
    request.session.flush()
    return redirect("login")

def catalogo(request):
    if "utente_id" not in request.session:
        return redirect("login")

    return render(request, "garage/catalogo.html")