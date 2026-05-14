from django.contrib import admin

from .models import (
    Utente,
    Cliente,
    Dipendente,
    Auto,
    Recensione,
    Intervento,
    TestDrive,
    Vendita,
)


@admin.register(Utente)
class UtenteAdmin(admin.ModelAdmin):
    list_display = ("id_utente", "email")
    search_fields = ("email",)


@admin.register(Cliente)
class ClienteAdmin(admin.ModelAdmin):
    list_display = ("utente", "nome", "cognome", "telefono", "codice_fiscale")
    search_fields = ("nome", "cognome", "codice_fiscale", "utente__email")


@admin.register(Dipendente)
class DipendenteAdmin(admin.ModelAdmin):
    list_display = ("utente", "nome", "cognome", "telefono", "ruolo")
    list_filter = ("ruolo",)
    search_fields = ("nome", "cognome", "utente__email")


@admin.register(Auto)
class AutoAdmin(admin.ModelAdmin):
    list_display = (
        "id_auto",
        "marca",
        "modello",
        "anno_immatricolazione",
        "chilometraggio",
        "alimentazione",
        "prezzo",
        "tipo_auto",
        "stato",
    )
    list_filter = ("stato", "tipo_auto", "alimentazione", "cambio")
    search_fields = ("marca", "modello", "colore")
    ordering = ("id_auto",)


@admin.register(TestDrive)
class TestDriveAdmin(admin.ModelAdmin):
    list_display = ("id_test_drive", "data_test_drive", "stato", "cliente", "auto", "dipendente")
    list_filter = ("stato", "data_test_drive")
    search_fields = ("cliente__nome", "cliente__cognome", "auto__marca", "auto__modello")


@admin.register(Vendita)
class VenditaAdmin(admin.ModelAdmin):
    list_display = ("id_vendita", "data_vendita", "cliente", "auto", "dipendente")
    list_filter = ("data_vendita",)
    search_fields = ("cliente__nome", "cliente__cognome", "auto__marca", "auto__modello")


@admin.register(Intervento)
class InterventoAdmin(admin.ModelAdmin):
    list_display = ("id_intervento", "data_intervento", "tipo_intervento", "costo", "auto", "dipendente")
    list_filter = ("data_intervento", "tipo_intervento")
    search_fields = ("tipo_intervento", "auto__marca", "auto__modello", "dipendente__nome", "dipendente__cognome")


@admin.register(Recensione)
class RecensioneAdmin(admin.ModelAdmin):
    list_display = ("id_recensione", "voto", "cliente", "auto")
    list_filter = ("voto",)
    search_fields = ("cliente__nome", "cliente__cognome", "auto__marca", "auto__modello", "commento")