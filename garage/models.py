from django.db import models
from django.core.validators import MinValueValidator, MaxValueValidator


class Sede(models.Model):
    nome = models.CharField(max_length=100, unique=True)
    indirizzo = models.CharField(max_length=200)
    citta = models.CharField(max_length=100)
    telefono = models.CharField(max_length=20)
    email = models.EmailField(unique=True)

    class Meta:
        verbose_name = "Sede"
        verbose_name_plural = "Sedi"

    def __str__(self):
        return self.nome


class Fornitore(models.Model):
    nome = models.CharField(max_length=100)
    partita_iva = models.CharField(max_length=20, unique=True)
    indirizzo = models.CharField(max_length=200)
    telefono = models.CharField(max_length=20)
    email = models.EmailField(unique=True)

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

    nome = models.CharField(max_length=100)
    cognome = models.CharField(max_length=100)
    email = models.EmailField(unique=True)
    password = models.CharField(max_length=200)
    telefono = models.CharField(max_length=20)
    ruolo = models.CharField(max_length=20, choices=RUOLI)
    codice_fiscale = models.CharField(max_length=16, unique=True, blank=True, null=True)
    stipendio = models.DecimalField(
        max_digits=10,
        decimal_places=2,
        validators=[MinValueValidator(0.01)],
        blank=True,
        null=True
    )

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
        ("in_manutenzione", "In manutenzione"),
        ("noleggiata", "Noleggiata"),
    ]

    marca = models.CharField(max_length=100)
    modello = models.CharField(max_length=100)
    anno = models.IntegerField()
    chilometraggio = models.IntegerField(validators=[MinValueValidator(0)])
    alimentazione = models.CharField(max_length=50)
    cambio = models.CharField(max_length=50)
    colore = models.CharField(max_length=50)
    prezzo = models.DecimalField(max_digits=10, decimal_places=2, validators=[MinValueValidator(0.01)])
    tipo_auto = models.CharField(max_length=20, choices=TIPO_AUTO)
    stato = models.CharField(max_length=20, choices=STATO_AUTO, default="disponibile")
    sede = models.ForeignKey(Sede, on_delete=models.PROTECT)

    class Meta:
        verbose_name = "Auto"
        verbose_name_plural = "Auto"

    def __str__(self):
        return f"{self.marca} {self.modello} - {self.anno}"


class Recensione(models.Model):
    cliente = models.ForeignKey(
        Utente,
        on_delete=models.CASCADE,
        related_name="recensioni_cliente"
    )
    auto = models.ForeignKey(
        Auto,
        on_delete=models.CASCADE,
        related_name="recensioni"
    )
    voto = models.IntegerField(validators=[MinValueValidator(1), MaxValueValidator(5)])
    commento = models.TextField()

    class Meta:
        unique_together = ("cliente", "auto")
        verbose_name = "Recensione"
        verbose_name_plural = "Recensioni"

    def __str__(self):
        return f"Recensione {self.auto} - voto {self.voto}"


class TestDrive(models.Model):
    cliente = models.ForeignKey(
        Utente,
        on_delete=models.CASCADE,
        related_name="test_drive_cliente"
    )
    auto = models.ForeignKey(
        Auto,
        on_delete=models.CASCADE,
        related_name="test_drive"
    )
    venditore = models.ForeignKey(
        Utente,
        on_delete=models.PROTECT,
        related_name="test_drive_venditore"
    )
    data_test_drive = models.DateField()

    class Meta:
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
    auto = models.OneToOneField(
        Auto,
        on_delete=models.PROTECT,
        related_name="vendita"
    )
    venditore = models.ForeignKey(
        Utente,
        on_delete=models.PROTECT,
        related_name="vendite_venditore"
    )
    data_vendita = models.DateField()

    class Meta:
        verbose_name = "Vendita"
        verbose_name_plural = "Vendite"

    def __str__(self):
        return f"Vendita {self.auto} - {self.cliente}"


class Noleggio(models.Model):
    cliente = models.ForeignKey(
        Utente,
        on_delete=models.CASCADE,
        related_name="noleggi_cliente"
    )
    auto = models.ForeignKey(
        Auto,
        on_delete=models.PROTECT,
        related_name="noleggi"
    )
    venditore = models.ForeignKey(
        Utente,
        on_delete=models.PROTECT,
        related_name="noleggi_venditore"
    )
    data_inizio = models.DateField()
    data_fine = models.DateField()
    costo_giornaliero = models.DecimalField(max_digits=10, decimal_places=2, validators=[MinValueValidator(0.01)])
    costo_totale = models.DecimalField(max_digits=10, decimal_places=2, validators=[MinValueValidator(0.01)])

    class Meta:
        verbose_name = "Noleggio"
        verbose_name_plural = "Noleggi"

    def __str__(self):
        return f"Noleggio {self.auto} - {self.cliente}"


class Intervento(models.Model):
    auto = models.ForeignKey(
        Auto,
        on_delete=models.CASCADE,
        related_name="interventi"
    )
    meccanico = models.ForeignKey(
        Utente,
        on_delete=models.PROTECT,
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


class Fornitura(models.Model):
    fornitore = models.ForeignKey(
        Fornitore,
        on_delete=models.PROTECT,
        related_name="forniture"
    )
    auto = models.OneToOneField(
        Auto,
        on_delete=models.CASCADE,
        related_name="fornitura"
    )
    sede = models.ForeignKey(
        Sede,
        on_delete=models.PROTECT,
        related_name="forniture"
    )
    data_fornitura = models.DateField()
    prezzo_acquisto = models.DecimalField(max_digits=10, decimal_places=2, validators=[MinValueValidator(0.01)])

    class Meta:
        verbose_name = "Fornitura"
        verbose_name_plural = "Forniture"

    def __str__(self):
        return f"Fornitura {self.auto} - {self.fornitore}"


class Impiego(models.Model):
    dipendente = models.ForeignKey(
        Utente,
        on_delete=models.CASCADE,
        related_name="impieghi"
    )
    sede = models.ForeignKey(
        Sede,
        on_delete=models.CASCADE,
        related_name="impieghi"
    )

    class Meta:
        unique_together = ("dipendente", "sede")
        verbose_name = "Impiego"
        verbose_name_plural = "Impieghi"

    def __str__(self):
        return f"{self.dipendente} - {self.sede}"