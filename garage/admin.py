from django.contrib import admin
from .models import (
    Sede,
    Fornitore,
    Utente,
    Auto,
    TestDrive,
    Vendita,
    Intervento,
    Recensione,
)

admin.site.register(Sede)
admin.site.register(Fornitore)
admin.site.register(Utente)
admin.site.register(Auto)
admin.site.register(TestDrive)
admin.site.register(Vendita)
admin.site.register(Intervento)
admin.site.register(Recensione)