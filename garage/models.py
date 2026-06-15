from django.db import models
from django.core.validators import MinValueValidator, MaxValueValidator


class Sede(models.Model):
    nome = models.CharField(max_length=100)
    indirizzo = models.CharField(max_length=200)
    citta = models.CharField(max_length=100)
    telefono = models.CharField(max_length=20, blank=True, null=True)

    class Meta:
        verbose_name = "Sede"
        verbose_name_plural = "Sedi"

    def __str__(self):
        return f"{self.nome} - {self.citta}"


class Fornitore(models.Model):
    nome = models.CharField(max_length=100)
    partita_iva = models.CharField(max_length=20, unique=True)
    telefono = models.CharField(max_length=20, blank=True, null=True)
    email = models.EmailField(blank=True, null=True)

    class Meta:
        verbose_name = "Fornitore"
        verbose_name_plural = "Fornitori"

    def __str__(self):
        return self.nome


class Utente(models.Model):
    RUOLI = [
        ("cliente", "Cliente"),
        ("venditore", "Venditore"),
        ("meccanico", "Meccanico"),
    ]

    email = models.EmailField(unique=True)
    password = models.CharField(max_length=200)

    nome = models.CharField(max_length=100)
    cognome = models.CharField(max_length=100)
    telefono = models.CharField(max_length=20, blank=True, null=True)

    codice_fiscale = models.CharField(max_length=16, unique=True, blank=True, null=True)
    ruolo = models.CharField(max_length=20, choices=RUOLI)

    sede = models.ForeignKey(Sede, on_delete=models.SET_NULL, blank=True, null=True)

    class Meta:
        verbose_name = "Utente"
        verbose_name_plural = "Utenti"

    def __str__(self):
        return f"{self.nome} {self.cognome} ({self.ruolo})"


class Auto(models.Model):
    TIPO_AUTO = [
        ("nuova", "Nuova"),
        ("usata", "Usata"),
    ]

    STATO_AUTO = [
        ("disponibile", "Disponibile"),
        ("venduta", "Venduta"),
        ("manutenzione", "In manutenzione"),
        ("noleggiata", "Noleggiata"),
    ]

    marca = models.CharField(max_length=100)
    modello = models.CharField(max_length=100)
    anno = models.IntegerField()
    chilometraggio = models.IntegerField(validators=[MinValueValidator(0)])
    alimentazione = models.CharField(max_length=50)
    cambio = models.CharField(max_length=50)
    colore = models.CharField(max_length=50)
    prezzo = models.DecimalField(max_digits=10, decimal_places=2, validators=[MinValueValidator(0)])
    tipo_auto = models.CharField(max_length=20, choices=TIPO_AUTO)
    stato = models.CharField(max_length=20, choices=STATO_AUTO, default="disponibile")

    sede = models.ForeignKey(Sede, on_delete=models.SET_NULL, blank=True, null=True)
    fornitore = models.ForeignKey(Fornitore, on_delete=models.SET_NULL, blank=True, null=True)

    class Meta:
        verbose_name = "Auto"
        verbose_name_plural = "Auto"

    def __str__(self):
        return f"{self.marca} {self.modello}"


class TestDrive(models.Model):
    STATO_TEST_DRIVE = [
        ("prenotato", "Prenotato"),
        ("effettuato", "Effettuato"),
        ("annullato", "Annullato"),
    ]

    cliente = models.ForeignKey(
        Utente,
        on_delete=models.CASCADE,
        related_name="test_drive_cliente"
    )
    auto = models.ForeignKey(Auto, on_delete=models.CASCADE)
    venditore = models.ForeignKey(
        Utente,
        on_delete=models.SET_NULL,
        null=True,
        related_name="test_drive_venditore"
    )
    data_test_drive = models.DateField()
    stato = models.CharField(max_length=20, choices=STATO_TEST_DRIVE, default="prenotato")

    class Meta:
        unique_together = ("cliente", "auto")
        verbose_name = "Test drive"
        verbose_name_plural = "Test drive"

    def __str__(self):
        return f"Test drive {self.auto} - {self.cliente}"


class Vendita(models.Model):
    cliente = models.ForeignKey(
        Utente,
        on_delete=models.CASCADE,
        related_name="vendite_cliente"
    )
    auto = models.OneToOneField(Auto, on_delete=models.CASCADE)
    venditore = models.ForeignKey(
        Utente,
        on_delete=models.SET_NULL,
        null=True,
        related_name="vendite_venditore"
    )
    data_vendita = models.DateField()
    prezzo_finale = models.DecimalField(max_digits=10, decimal_places=2)

    class Meta:
        verbose_name = "Vendita"
        verbose_name_plural = "Vendite"

    def __str__(self):
        return f"Vendita {self.auto} - {self.cliente}"


class Intervento(models.Model):
    auto = models.ForeignKey(Auto, on_delete=models.CASCADE)
    meccanico = models.ForeignKey(
        Utente,
        on_delete=models.SET_NULL,
        null=True,
        related_name="interventi_meccanico"
    )
    data_intervento = models.DateField()
    tipo_intervento = models.CharField(max_length=100)
    costo = models.DecimalField(max_digits=10, decimal_places=2, validators=[MinValueValidator(0)])

    class Meta:
        verbose_name = "Intervento"
        verbose_name_plural = "Interventi"

    def __str__(self):
        return f"Intervento {self.auto} - {self.tipo_intervento}"


class Recensione(models.Model):
    cliente = models.ForeignKey(
        Utente,
        on_delete=models.CASCADE,
        related_name="recensioni_cliente"
    )
    auto = models.ForeignKey(Auto, on_delete=models.CASCADE)
    voto = models.IntegerField(validators=[MinValueValidator(1), MaxValueValidator(5)])
    commento = models.TextField(blank=True, null=True)

    class Meta:
        unique_together = ("cliente", "auto")
        verbose_name = "Recensione"
        verbose_name_plural = "Recensioni"

    def __str__(self):
        return f"Recensione {self.auto} - voto {self.voto}"