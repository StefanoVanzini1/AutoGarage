from django.contrib import admin
from .models import Utente, Cliente, Dipendente, Auto, Recensione, Intervento, TestDrive, Vendita

admin.site.register(Utente)
admin.site.register(Cliente)
admin.site.register(Dipendente)
admin.site.register(Auto)
admin.site.register(Recensione)
admin.site.register(Intervento)
admin.site.register(TestDrive)
admin.site.register(Vendita)