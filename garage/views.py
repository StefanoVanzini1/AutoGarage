from django.shortcuts import render, redirect, get_object_or_404
from .forms import RegistrazioneClienteForm, LoginForm, TestDriveForm
from .models import Utente, Auto, TestDrive, Intervento


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

                if utente.ruolo == "cliente":
                    return redirect("catalogo")

                if utente.ruolo == "venditore":
                    return redirect("dashboard_venditore")

                if utente.ruolo == "meccanico":
                    return redirect("dashboard_meccanico")

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

    auto_list = Auto.objects.all().order_by("marca", "modello")

    return render(request, "garage/catalogo.html", {
        "auto_list": auto_list
    })


def dettaglio_auto(request, auto_id):
    if "utente_id" not in request.session:
        return redirect("login")

    auto = get_object_or_404(Auto, id=auto_id)
    recensioni = auto.recensioni.all()
    messaggio = request.session.pop("messaggio", None)

    return render(
        request,
        "garage/dettaglio_auto.html",
        {
            "auto": auto,
            "messaggio": messaggio,
            "recensioni": recensioni
        }
    )


def prenota_test_drive(request, auto_id):
    if "utente_id" not in request.session:
        return redirect("login")

    auto = get_object_or_404(Auto, id=auto_id)
    cliente = get_object_or_404(Utente, id=request.session["utente_id"])
    venditore = Utente.objects.filter(ruolo="venditore").first()

    if request.method == "POST":
        form = TestDriveForm(request.POST)

        if form.is_valid():
            test_drive = form.save(commit=False)
            test_drive.auto = auto
            test_drive.cliente = cliente
            test_drive.venditore = venditore
            test_drive.save()

            request.session["messaggio"] = "Prenotazione test drive effettuata con successo."

            return redirect("dettaglio_auto", auto_id=auto.id)
    else:
        form = TestDriveForm()

    return render(request, "garage/prenota_test_drive.html", {
        "form": form,
        "auto": auto
    })


def dashboard_venditore(request):
    if "utente_id" not in request.session:
        return redirect("login")

    if request.session.get("utente_ruolo") != "venditore":
        return redirect("catalogo")

    venditore = get_object_or_404(
        Utente,
        id=request.session["utente_id"]
    )

    test_drive = TestDrive.objects.filter(
        venditore=venditore
    ).order_by("-data_test_drive")

    return render(
        request,
        "garage/dashboard_venditore.html",
        {
            "test_drive": test_drive
        }
    )


def dashboard_meccanico(request):
    if "utente_id" not in request.session:
        return redirect("login")

    if request.session.get("utente_ruolo") != "meccanico":
        return redirect("catalogo")

    meccanico = get_object_or_404(
        Utente,
        id=request.session["utente_id"]
    )

    interventi = Intervento.objects.filter(
        meccanico=meccanico
    ).order_by("-data_intervento")

    return render(
        request,
        "garage/dashboard_meccanico.html",
        {
            "interventi": interventi
        }
    )