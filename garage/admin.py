from django.contrib import admin
from .models import (
    Sede,
    Fornitore,
    Utente,
    Auto,
    Recensione,
    TestDrive,
    Vendita,
    Noleggio,
    Intervento,
    Fornitura,
    Impiego,
)

admin.site.register(Sede)
admin.site.register(Fornitore)
admin.site.register(Utente)
admin.site.register(Auto)
admin.site.register(Recensione)
admin.site.register(TestDrive)
admin.site.register(Vendita)
admin.site.register(Noleggio)
admin.site.register(Intervento)
admin.site.register(Fornitura)
admin.site.register(Impiego)