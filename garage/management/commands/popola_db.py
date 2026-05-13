from datetime import date
from decimal import Decimal

from django.core.management.base import BaseCommand

from garage.models import (
    Utente,
    Cliente,
    Dipendente,
    Auto,
    TestDrive,
    Vendita,
    Intervento,
    Recensione,
)


class Command(BaseCommand):
    help = "Popola il database AutoGarage con gli stessi dati del dump iniziale"

    def handle(self, *args, **options):
        self.stdout.write("Pulizia dati esistenti...")

        Recensione.objects.all().delete()
        Intervento.objects.all().delete()
        Vendita.objects.all().delete()
        TestDrive.objects.all().delete()
        Auto.objects.all().delete()
        Cliente.objects.all().delete()
        Dipendente.objects.all().delete()
        Utente.objects.all().delete()

        self.stdout.write("Creazione utenti...")

        utenti = {
            1: Utente.objects.create(id_utente=1, email="mario.rossi@email.com", password="mario123"),
            2: Utente.objects.create(id_utente=2, email="lucia.bianchi@email.com", password="lucia123"),
            3: Utente.objects.create(id_utente=3, email="andrea.verdi@email.com", password="andrea123"),
            4: Utente.objects.create(id_utente=4, email="elena.gallo@email.com", password="elena123"),
            5: Utente.objects.create(id_utente=5, email="francesco.riva@email.com", password="francesco123"),
            6: Utente.objects.create(id_utente=6, email="giulia.neri@email.com", password="giulia123"),
            7: Utente.objects.create(id_utente=7, email="sara.conti@email.com", password="sara123"),
            8: Utente.objects.create(id_utente=8, email="marco.blu@email.com", password="marco123"),
            9: Utente.objects.create(id_utente=9, email="paolo.ferri@email.com", password="paolo123"),
            10: Utente.objects.create(id_utente=10, email="davide.moro@email.com", password="davide123"),
        }

        self.stdout.write("Creazione clienti...")

        clienti = {
            1: Cliente.objects.create(
                utente=utenti[1],
                nome="Mario",
                cognome="Rossi",
                telefono="3331112222",
                codice_fiscale="RSSMRA90A01H501U",
            ),
            2: Cliente.objects.create(
                utente=utenti[2],
                nome="Lucia",
                cognome="Bianchi",
                telefono="3332223333",
                codice_fiscale="BNCLCU92B41F205K",
            ),
            3: Cliente.objects.create(
                utente=utenti[3],
                nome="Andrea",
                cognome="Verdi",
                telefono="3334445555",
                codice_fiscale="VRDNDR88C12L219P",
            ),
            4: Cliente.objects.create(
                utente=utenti[4],
                nome="Elena",
                cognome="Gallo",
                telefono="3335556666",
                codice_fiscale="GLLLNE95D45H501X",
            ),
            5: Cliente.objects.create(
                utente=utenti[5],
                nome="Francesco",
                cognome="Riva",
                telefono="3337778888",
                codice_fiscale="RVAFNC89E21F205Z",
            ),
        }

        self.stdout.write("Creazione dipendenti...")

        dipendenti = {
            6: Dipendente.objects.create(
                utente=utenti[6],
                nome="Giulia",
                cognome="Neri",
                telefono="3336667777",
                ruolo="venditore",
            ),
            7: Dipendente.objects.create(
                utente=utenti[7],
                nome="Sara",
                cognome="Conti",
                telefono="3330001111",
                ruolo="venditore",
            ),
            8: Dipendente.objects.create(
                utente=utenti[8],
                nome="Marco",
                cognome="Blu",
                telefono="3339990000",
                ruolo="venditore",
            ),
            9: Dipendente.objects.create(
                utente=utenti[9],
                nome="Paolo",
                cognome="Ferri",
                telefono="3338889999",
                ruolo="meccanico",
            ),
            10: Dipendente.objects.create(
                utente=utenti[10],
                nome="Davide",
                cognome="Moro",
                telefono="3331234567",
                ruolo="meccanico",
            ),
        }

        self.stdout.write("Creazione auto...")

        auto = {
            1: Auto.objects.create(
                id_auto=1,
                marca="Fiat",
                modello="500",
                anno_immatricolazione=2022,
                chilometraggio=12000,
                alimentazione="benzina",
                cambio="manuale",
                colore="bianco",
                prezzo=Decimal("15000.00"),
                tipo_auto="usata",
                stato="disponibile",
            ),
            2: Auto.objects.create(
                id_auto=2,
                marca="Volkswagen",
                modello="Golf",
                anno_immatricolazione=2023,
                chilometraggio=0,
                alimentazione="diesel",
                cambio="automatico",
                colore="nero",
                prezzo=Decimal("28000.00"),
                tipo_auto="nuova",
                stato="disponibile",
            ),
            3: Auto.objects.create(
                id_auto=3,
                marca="Toyota",
                modello="Yaris",
                anno_immatricolazione=2021,
                chilometraggio=25000,
                alimentazione="ibrida",
                cambio="automatico",
                colore="rosso",
                prezzo=Decimal("18000.00"),
                tipo_auto="usata",
                stato="disponibile",
            ),
            4: Auto.objects.create(
                id_auto=4,
                marca="BMW",
                modello="Serie 1",
                anno_immatricolazione=2020,
                chilometraggio=40000,
                alimentazione="diesel",
                cambio="automatico",
                colore="grigio",
                prezzo=Decimal("26000.00"),
                tipo_auto="usata",
                stato="venduta",
            ),
            5: Auto.objects.create(
                id_auto=5,
                marca="Renault",
                modello="Clio",
                anno_immatricolazione=2019,
                chilometraggio=55000,
                alimentazione="benzina",
                cambio="manuale",
                colore="blu",
                prezzo=Decimal("12000.00"),
                tipo_auto="usata",
                stato="in_manutenzione",
            ),
            6: Auto.objects.create(
                id_auto=6,
                marca="Audi",
                modello="A3",
                anno_immatricolazione=2022,
                chilometraggio=18000,
                alimentazione="diesel",
                cambio="automatico",
                colore="nero",
                prezzo=Decimal("30000.00"),
                tipo_auto="usata",
                stato="venduta",
            ),
            7: Auto.objects.create(
                id_auto=7,
                marca="Ford",
                modello="Puma",
                anno_immatricolazione=2024,
                chilometraggio=0,
                alimentazione="benzina",
                cambio="manuale",
                colore="verde",
                prezzo=Decimal("24000.00"),
                tipo_auto="nuova",
                stato="disponibile",
            ),
            8: Auto.objects.create(
                id_auto=8,
                marca="Peugeot",
                modello="208",
                anno_immatricolazione=2021,
                chilometraggio=30000,
                alimentazione="benzina",
                cambio="manuale",
                colore="giallo",
                prezzo=Decimal("16000.00"),
                tipo_auto="usata",
                stato="disponibile",
            ),
            9: Auto.objects.create(
                id_auto=9,
                marca="Mercedes",
                modello="Classe A",
                anno_immatricolazione=2023,
                chilometraggio=8000,
                alimentazione="ibrida",
                cambio="automatico",
                colore="bianco",
                prezzo=Decimal("35000.00"),
                tipo_auto="usata",
                stato="venduta",
            ),
            10: Auto.objects.create(
                id_auto=10,
                marca="Opel",
                modello="Corsa",
                anno_immatricolazione=2020,
                chilometraggio=45000,
                alimentazione="benzina",
                cambio="manuale",
                colore="rosso",
                prezzo=Decimal("11000.00"),
                tipo_auto="usata",
                stato="in_manutenzione",
            ),
        }

        self.stdout.write("Creazione test drive...")

        TestDrive.objects.create(
            id_test_drive=1,
            data_test_drive=date(2025, 2, 10),
            stato="effettuato",
            cliente=clienti[1],
            auto=auto[1],
            dipendente=dipendenti[6],
        )
        TestDrive.objects.create(
            id_test_drive=2,
            data_test_drive=date(2025, 2, 12),
            stato="effettuato",
            cliente=clienti[2],
            auto=auto[3],
            dipendente=dipendenti[7],
        )
        TestDrive.objects.create(
            id_test_drive=3,
            data_test_drive=date(2025, 2, 15),
            stato="effettuato",
            cliente=clienti[3],
            auto=auto[4],
            dipendente=dipendenti[6],
        )
        TestDrive.objects.create(
            id_test_drive=4,
            data_test_drive=date(2025, 2, 18),
            stato="effettuato",
            cliente=clienti[4],
            auto=auto[8],
            dipendente=dipendenti[8],
        )
        TestDrive.objects.create(
            id_test_drive=5,
            data_test_drive=date(2025, 2, 21),
            stato="effettuato",
            cliente=clienti[5],
            auto=auto[9],
            dipendente=dipendenti[7],
        )

        self.stdout.write("Creazione vendite...")

        Vendita.objects.create(
            id_vendita=1,
            data_vendita=date(2025, 2, 20),
            cliente=clienti[3],
            auto=auto[4],
            dipendente=dipendenti[6],
        )
        Vendita.objects.create(
            id_vendita=2,
            data_vendita=date(2025, 2, 25),
            cliente=clienti[5],
            auto=auto[9],
            dipendente=dipendenti[7],
        )
        Vendita.objects.create(
            id_vendita=3,
            data_vendita=date(2025, 3, 1),
            cliente=clienti[1],
            auto=auto[6],
            dipendente=dipendenti[8],
        )

        self.stdout.write("Creazione interventi...")

        Intervento.objects.create(
            id_intervento=1,
            data_intervento=date(2025, 1, 10),
            tipo_intervento="Controllo generale",
            costo=Decimal("150.00"),
            auto=auto[5],
            dipendente=dipendenti[9],
        )
        Intervento.objects.create(
            id_intervento=2,
            data_intervento=date(2025, 1, 18),
            tipo_intervento="Cambio olio",
            costo=Decimal("80.00"),
            auto=auto[1],
            dipendente=dipendenti[9],
        )
        Intervento.objects.create(
            id_intervento=3,
            data_intervento=date(2025, 2, 2),
            tipo_intervento="Controllo freni",
            costo=Decimal("120.00"),
            auto=auto[10],
            dipendente=dipendenti[10],
        )
        Intervento.objects.create(
            id_intervento=4,
            data_intervento=date(2025, 2, 8),
            tipo_intervento="Sostituzione pneumatici",
            costo=Decimal("300.00"),
            auto=auto[3],
            dipendente=dipendenti[10],
        )

        self.stdout.write("Creazione recensioni...")

        Recensione.objects.create(
            id_recensione=1,
            voto=5,
            commento="Auto molto comoda e piacevole da guidare.",
            cliente=clienti[1],
            auto=auto[1],
        )
        Recensione.objects.create(
            id_recensione=2,
            voto=4,
            commento="Buona esperienza durante il test drive.",
            cliente=clienti[2],
            auto=auto[3],
        )
        Recensione.objects.create(
            id_recensione=3,
            voto=5,
            commento="Venditore gentile e auto in ottime condizioni.",
            cliente=clienti[3],
            auto=auto[4],
        )
        Recensione.objects.create(
            id_recensione=4,
            voto=4,
            commento="Auto ben tenuta e personale disponibile.",
            cliente=clienti[5],
            auto=auto[9],
        )

        self.stdout.write(self.style.SUCCESS("Database popolato correttamente con i dati del dump."))