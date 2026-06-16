import os
import django
from datetime import date, timedelta
from decimal import Decimal

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "autogarage.settings")
django.setup()

from garage.models import (
    Sede, Fornitore, Utente, Auto, Recensione, TestDrive,
    Vendita, Noleggio, Intervento, Fornitura, Impiego
)


def main():
    print("Pulizia database...")
    Recensione.objects.all().delete()
    TestDrive.objects.all().delete()
    Vendita.objects.all().delete()
    Noleggio.objects.all().delete()
    Intervento.objects.all().delete()
    Fornitura.objects.all().delete()
    Impiego.objects.all().delete()
    Auto.objects.all().delete()
    Utente.objects.all().delete()
    Fornitore.objects.all().delete()
    Sede.objects.all().delete()

    print("Creazione sedi...")
    napoli = Sede.objects.create(
        nome="AutoGarage Napoli",
        indirizzo="Via Toledo 120",
        citta="Napoli",
        telefono="0811111111",
        email="napoli@autogarage.it"
    )
    caserta = Sede.objects.create(
        nome="AutoGarage Caserta",
        indirizzo="Viale Carlo III 45",
        citta="Caserta",
        telefono="0823111111",
        email="caserta@autogarage.it"
    )
    salerno = Sede.objects.create(
        nome="AutoGarage Salerno",
        indirizzo="Corso Garibaldi 88",
        citta="Salerno",
        telefono="0891111111",
        email="salerno@autogarage.it"
    )

    print("Creazione fornitori...")
    stellantis = Fornitore.objects.create(
        nome="Stellantis",
        partita_iva="11111111111",
        indirizzo="Corso Agnelli 200, Torino",
        telefono="0111111111",
        email="stellantis@fornitori.it"
    )
    volkswagen = Fornitore.objects.create(
        nome="Volkswagen Group Italia",
        partita_iva="22222222222",
        indirizzo="Viale G. R. Gumpert 1, Verona",
        telefono="0451111111",
        email="volkswagen@fornitori.it"
    )
    bmw = Fornitore.objects.create(
        nome="BMW Italia",
        partita_iva="33333333333",
        indirizzo="Via dell'Unione Europea 1, San Donato Milanese",
        telefono="0211111111",
        email="bmw@fornitori.it"
    )
    mercedes = Fornitore.objects.create(
        nome="Mercedes-Benz Italia",
        partita_iva="44444444444",
        indirizzo="Via Giulio Vincenzo Bona 110, Roma",
        telefono="0611111111",
        email="mercedes@fornitori.it"
    )

    print("Creazione utenti...")
    utenti = {}

    dati_utenti = [
        ("Marco", "Esposito", "marco.esposito@autogarage.it", "venditore", None, Decimal("1800.00"), napoli),
        ("Giulia", "Romano", "giulia.romano@autogarage.it", "venditore", None, Decimal("1850.00"), napoli),
        ("Antonio", "Russo", "antonio.russo@autogarage.it", "meccanico", None, Decimal("1700.00"), napoli),
        ("Giuseppe", "De Luca", "giuseppe.deluca@autogarage.it", "meccanico", None, Decimal("1750.00"), napoli),
        ("Francesco", "Greco", "francesco.greco@email.it", "cliente", "GRCFNC90A01F839A", None, None),
        ("Sara", "Lombardi", "sara.lombardi@email.it", "cliente", "LMBSRA92B41F839B", None, None),

        ("Davide", "Coppola", "davide.coppola@autogarage.it", "venditore", None, Decimal("1900.00"), caserta),
        ("Martina", "Ricci", "martina.ricci@autogarage.it", "venditore", None, Decimal("1880.00"), caserta),
        ("Vincenzo", "Marino", "vincenzo.marino@autogarage.it", "meccanico", None, Decimal("1800.00"), caserta),
        ("Raffaele", "Vitale", "raffaele.vitale@autogarage.it", "meccanico", None, Decimal("1780.00"), caserta),
        ("Andrea", "Gallo", "andrea.gallo@email.it", "cliente", "GLLNDR91C12B963C", None, None),
        ("Alessia", "Bruno", "alessia.bruno@email.it", "cliente", "BRNLSS93D52B963D", None, None),

        ("Alessio", "Caruso", "alessio.caruso@autogarage.it", "venditore", None, Decimal("2000.00"), salerno),
        ("Chiara", "Ferrara", "chiara.ferrara@autogarage.it", "venditore", None, Decimal("1950.00"), salerno),
        ("Fabio", "Conte", "fabio.conte@autogarage.it", "meccanico", None, Decimal("1900.00"), salerno),
        ("Carmine", "Santoro", "carmine.santoro@autogarage.it", "meccanico", None, Decimal("1850.00"), salerno),
        ("Roberto", "Leone", "roberto.leone@email.it", "cliente", "LNERRT89E15H703E", None, None),
        ("Matteo", "Serra", "matteo.serra@email.it", "cliente", "SRRMTT88F20H703F", None, None),
    ]

    for nome, cognome, email, ruolo, cf, stipendio, sede in dati_utenti:
        utente = Utente.objects.create(
            nome=nome,
            cognome=cognome,
            email=email,
            password=f"{ruolo.capitalize()}2026!",
            telefono="3330000000",
            ruolo=ruolo,
            codice_fiscale=cf,
            stipendio=stipendio
        )
        utenti[email] = utente

        if ruolo in ["venditore", "meccanico"]:
            Impiego.objects.create(dipendente=utente, sede=sede)

    print("Creazione auto e forniture...")

    dati_auto = [
        ("Fiat", "Panda", 2024, 0, "benzina", "manuale", "bianco", "15500.00", "nuova", napoli),
        ("Fiat", "500", 2023, 0, "ibrida", "manuale", "rosso", "18900.00", "nuova", napoli),
        ("Jeep", "Renegade", 2022, 28000, "diesel", "automatico", "nero", "24500.00", "usata", napoli),
        ("Alfa Romeo", "Tonale", 2024, 0, "ibrida", "automatico", "grigio", "38900.00", "nuova", napoli),
        ("Volkswagen", "Golf", 2021, 42000, "diesel", "manuale", "blu", "21900.00", "usata", napoli),
        ("Volkswagen", "T-Roc", 2024, 0, "benzina", "automatico", "bianco", "31500.00", "nuova", napoli),
        ("Audi", "A3", 2020, 55000, "diesel", "automatico", "nero", "24900.00", "usata", napoli),
        ("Audi", "Q2", 2024, 0, "benzina", "automatico", "grigio", "33500.00", "nuova", napoli),
        ("BMW", "Serie 1", 2021, 39000, "diesel", "automatico", "blu", "26900.00", "usata", napoli),
        ("BMW", "X1", 2024, 0, "ibrida", "automatico", "nero", "42900.00", "nuova", napoli),
        ("Mercedes", "Classe A", 2020, 61000, "diesel", "automatico", "argento", "25900.00", "usata", napoli),
        ("Mercedes", "GLA", 2024, 0, "benzina", "automatico", "bianco", "45900.00", "nuova", napoli),
        ("Jeep", "Compass", 2021, 47000, "diesel", "automatico", "verde", "27900.00", "usata", napoli),

        ("Fiat", "Tipo", 2020, 68000, "diesel", "manuale", "grigio", "13900.00", "usata", caserta),
        ("Fiat", "600", 2024, 0, "ibrida", "automatico", "arancione", "24900.00", "nuova", caserta),
        ("Volkswagen", "Polo", 2021, 51000, "benzina", "manuale", "blu", "14900.00", "usata", caserta),
        ("Audi", "A1", 2024, 0, "benzina", "automatico", "nero", "27900.00", "nuova", caserta),
        ("BMW", "Serie 3", 2020, 72000, "diesel", "automatico", "bianco", "29900.00", "usata", caserta),
        ("Mercedes", "CLA", 2024, 0, "ibrida", "automatico", "grigio", "41900.00", "nuova", caserta),
        ("Alfa Romeo", "Giulia", 2021, 59000, "diesel", "automatico", "rosso", "31900.00", "usata", caserta),

        ("Fiat", "Panda", 2022, 35000, "benzina", "manuale", "bianco", "12900.00", "usata", salerno),
        ("Jeep", "Avenger", 2024, 0, "elettrica", "automatico", "giallo", "37900.00", "nuova", salerno),
        ("Volkswagen", "Tiguan", 2020, 80000, "diesel", "automatico", "nero", "26900.00", "usata", salerno),
        ("Audi", "Q3", 2024, 0, "benzina", "automatico", "grigio", "44900.00", "nuova", salerno),
        ("BMW", "X3", 2021, 62000, "diesel", "automatico", "blu", "38900.00", "usata", salerno),
        ("Mercedes", "Classe C", 2024, 0, "ibrida", "automatico", "argento", "52900.00", "nuova", salerno),
        ("Alfa Romeo", "Stelvio", 2020, 76000, "diesel", "automatico", "nero", "34900.00", "usata", salerno),
        ("Fiat", "500X", 2024, 0, "benzina", "manuale", "verde", "25900.00", "nuova", salerno),
        ("Volkswagen", "Passat", 2021, 70000, "diesel", "automatico", "grigio", "23900.00", "usata", salerno),
        ("BMW", "Serie 5", 2024, 0, "ibrida", "automatico", "nero", "61900.00", "nuova", salerno),
    ]

    auto_create = []

    for i, dati in enumerate(dati_auto):
        marca, modello, anno, km, alimentazione, cambio, colore, prezzo, tipo_auto, sede = dati

        fornitore_corretto = {
            "Fiat": stellantis,
            "Alfa Romeo": stellantis,
            "Jeep": stellantis,
            "Volkswagen": volkswagen,
            "Audi": volkswagen,
            "BMW": bmw,
            "Mercedes": mercedes,
        }[marca]

        auto = Auto.objects.create(
            marca=marca,
            modello=modello,
            anno=anno,
            chilometraggio=km,
            alimentazione=alimentazione,
            cambio=cambio,
            colore=colore,
            prezzo=Decimal(prezzo),
            tipo_auto=tipo_auto,
            stato="disponibile",
            sede=sede
        )
        auto_create.append(auto)

        Fornitura.objects.create(
            fornitore=fornitore_corretto,
            auto=auto,
            sede=sede,
            data_fornitura=date(2025, 1, 10) + timedelta(days=i * 5),
            prezzo_acquisto=Decimal(prezzo) * Decimal("0.78")
        )

    print("Creazione vendite...")
    venditori = {
        napoli: [utenti["marco.esposito@autogarage.it"], utenti["giulia.romano@autogarage.it"]],
        caserta: [utenti["davide.coppola@autogarage.it"], utenti["martina.ricci@autogarage.it"]],
        salerno: [utenti["alessio.caruso@autogarage.it"], utenti["chiara.ferrara@autogarage.it"]],
    }

    clienti = [
        utenti["francesco.greco@email.it"],
        utenti["sara.lombardi@email.it"],
        utenti["andrea.gallo@email.it"],
        utenti["alessia.bruno@email.it"],
        utenti["roberto.leone@email.it"],
        utenti["matteo.serra@email.it"],
    ]

    vendite_data = [
        (clienti[0], auto_create[0], venditori[napoli][0], date(2025, 9, 10)),
        (clienti[1], auto_create[2], venditori[napoli][1], date(2025, 9, 18)),
        (clienti[0], auto_create[5], venditori[napoli][0], date(2025, 10, 2)),
        (clienti[2], auto_create[14], venditori[caserta][0], date(2025, 10, 8)),
        (clienti[4], auto_create[22], venditori[salerno][0], date(2025, 10, 15)),
        (clienti[5], auto_create[25], venditori[salerno][1], date(2025, 11, 3)),
    ]

    for cliente, auto, venditore, data_vendita in vendite_data:
        Vendita.objects.create(
            cliente=cliente,
            auto=auto,
            venditore=venditore,
            data_vendita=data_vendita
        )
        auto.stato = "venduta"
        auto.save()

    print("Creazione noleggi...")
    noleggi_data = [
        (clienti[0], auto_create[7], venditori[napoli][1], date(2025, 11, 1), date(2025, 11, 5), "65.00"),
        (clienti[1], auto_create[9], venditori[napoli][0], date(2025, 11, 7), date(2025, 11, 10), "80.00"),
        (clienti[2], auto_create[16], venditori[caserta][1], date(2025, 11, 12), date(2025, 11, 16), "55.00"),
        (clienti[3], auto_create[18], venditori[caserta][0], date(2025, 11, 18), date(2025, 11, 21), "75.00"),
        (clienti[4], auto_create[23], venditori[salerno][1], date(2025, 12, 1), date(2025, 12, 4), "85.00"),
        (clienti[5], auto_create[28], venditori[salerno][0], date(2025, 12, 6), date(2025, 12, 9), "70.00"),
    ]

    for cliente, auto, venditore, inizio, fine, costo_giornaliero in noleggi_data:
        giorni = (fine - inizio).days + 1
        costo = Decimal(costo_giornaliero)
        Noleggio.objects.create(
            cliente=cliente,
            auto=auto,
            venditore=venditore,
            data_inizio=inizio,
            data_fine=fine,
            costo_giornaliero=costo,
            costo_totale=costo * giorni
        )
        auto.stato = "noleggiata"
        auto.save()

    print("Creazione test drive...")
    test_drive_data = [
        (clienti[0], auto_create[3], venditori[napoli][0], date(2025, 12, 10)),
        (clienti[1], auto_create[4], venditori[napoli][1], date(2025, 12, 11)),
        (clienti[2], auto_create[15], venditori[caserta][0], date(2025, 12, 12)),
        (clienti[3], auto_create[17], venditori[caserta][1], date(2025, 12, 13)),
        (clienti[4], auto_create[21], venditori[salerno][0], date(2025, 12, 14)),
        (clienti[5], auto_create[24], venditori[salerno][1], date(2025, 12, 15)),
    ]

    for cliente, auto, venditore, data_test_drive in test_drive_data:
        TestDrive.objects.create(
            cliente=cliente,
            auto=auto,
            venditore=venditore,
            data_test_drive=data_test_drive
        )

    print("Creazione interventi...")
    meccanici = {
        napoli: [utenti["antonio.russo@autogarage.it"], utenti["giuseppe.deluca@autogarage.it"]],
        caserta: [utenti["vincenzo.marino@autogarage.it"], utenti["raffaele.vitale@autogarage.it"]],
        salerno: [utenti["fabio.conte@autogarage.it"], utenti["carmine.santoro@autogarage.it"]],
    }

    interventi_data = [
        (auto_create[1], meccanici[napoli][0], date(2025, 10, 20), "Tagliando", "180.00"),
        (auto_create[6], meccanici[napoli][1], date(2025, 10, 24), "Cambio gomme", "320.00"),
        (auto_create[13], meccanici[caserta][0], date(2025, 10, 28), "Diagnostica motore", "120.00"),
        (auto_create[19], meccanici[caserta][1], date(2025, 11, 2), "Sostituzione freni", "410.00"),
        (auto_create[20], meccanici[salerno][0], date(2025, 11, 6), "Controllo batteria", "90.00"),
        (auto_create[26], meccanici[salerno][1], date(2025, 11, 10), "Revisione generale", "250.00"),
    ]

    for auto, meccanico, data_intervento, tipo, costo in interventi_data:
        Intervento.objects.create(
            auto=auto,
            meccanico=meccanico,
            data_intervento=data_intervento,
            tipo_intervento=tipo,
            costo=Decimal(costo)
        )

    print("Creazione recensioni...")
    recensioni_data = [
        (clienti[0], auto_create[0], 5, "Auto perfetta per la città, personale molto disponibile."),
        (clienti[1], auto_create[2], 5, "Ottima esperienza di acquisto e venditore molto chiaro."),
        (clienti[2], auto_create[14], 4, "Auto consegnata rapidamente e in ottime condizioni."),
        (clienti[3], auto_create[17], 4, "Test drive organizzato bene, personale gentile."),
        (clienti[4], auto_create[22], 5, "Sono molto soddisfatto dell'acquisto."),
        (clienti[5], auto_create[25], 3, "Buona auto, tempi di consegna un po' lunghi."),
    ]

    for cliente, auto, voto, commento in recensioni_data:
        Recensione.objects.create(
            cliente=cliente,
            auto=auto,
            voto=voto,
            commento=commento
        )

    print("Database popolato correttamente!")
    print("Forniture corrette:")
    print("- Fiat, Alfa Romeo, Jeep -> Stellantis")
    print("- Volkswagen, Audi -> Volkswagen Group Italia")
    print("- BMW -> BMW Italia")
    print("- Mercedes -> Mercedes-Benz Italia")


if __name__ == "__main__":
    main()