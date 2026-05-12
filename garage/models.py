from django.db import models
from django.core.validators import MinValueValidator, MaxValueValidator


class Utente(models.Model):
    id_utente = models.AutoField(primary_key=True)
    email = models.EmailField(unique=True)
    password = models.CharField(max_length=128)

    def __str__(self):
        return self.email


class Cliente(models.Model):
    utente = models.OneToOneField(
        Utente,
        on_delete=models.CASCADE,
        primary_key=True,
        db_column='id_utente'
    )
    nome = models.CharField(max_length=50)
    cognome = models.CharField(max_length=50)
    telefono = models.CharField(max_length=20)
    codice_fiscale = models.CharField(max_length=16, unique=True)

    def __str__(self):
        return f"{self.nome} {self.cognome}"


class Dipendente(models.Model):
    RUOLO_CHOICES = [
        ('venditore', 'Venditore'),
        ('meccanico', 'Meccanico'),
    ]

    utente = models.OneToOneField(
        Utente,
        on_delete=models.CASCADE,
        primary_key=True,
        db_column='id_utente'
    )
    nome = models.CharField(max_length=50)
    cognome = models.CharField(max_length=50)
    telefono = models.CharField(max_length=20)
    ruolo = models.CharField(max_length=20, choices=RUOLO_CHOICES)

    def __str__(self):
        return f"{self.nome} {self.cognome} - {self.ruolo}"


class Auto(models.Model):
    TIPO_AUTO_CHOICES = [
        ('nuova', 'Nuova'),
        ('usata', 'Usata'),
    ]

    STATO_CHOICES = [
        ('disponibile', 'Disponibile'),
        ('venduta', 'Venduta'),
        ('in_manutenzione', 'In manutenzione'),
    ]

    id_auto = models.AutoField(primary_key=True)
    marca = models.CharField(max_length=50)
    modello = models.CharField(max_length=50)
    anno_immatricolazione = models.PositiveIntegerField()
    chilometraggio = models.PositiveIntegerField(default=0)
    alimentazione = models.CharField(max_length=30)
    cambio = models.CharField(max_length=30)
    colore = models.CharField(max_length=30)
    prezzo = models.DecimalField(max_digits=10, decimal_places=2, validators=[MinValueValidator(0.01)])
    tipo_auto = models.CharField(max_length=20, choices=TIPO_AUTO_CHOICES)
    stato = models.CharField(max_length=20, choices=STATO_CHOICES, default='disponibile')

    def __str__(self):
        return f"{self.marca} {self.modello}"


class Recensione(models.Model):
    id_recensione = models.AutoField(primary_key=True)
    voto = models.PositiveSmallIntegerField(validators=[MinValueValidator(1), MaxValueValidator(5)])
    commento = models.TextField()
    cliente = models.ForeignKey(Cliente, on_delete=models.CASCADE)
    auto = models.ForeignKey(Auto, on_delete=models.CASCADE)

    class Meta:
        constraints = [
            models.UniqueConstraint(fields=['cliente', 'auto'], name='unique_recensione_cliente_auto')
        ]

    def __str__(self):
        return f"Recensione {self.voto}/5 - {self.auto}"


class Intervento(models.Model):
    id_intervento = models.AutoField(primary_key=True)
    data_intervento = models.DateField()
    tipo_intervento = models.CharField(max_length=100)
    costo = models.DecimalField(max_digits=8, decimal_places=2, validators=[MinValueValidator(0)])
    auto = models.ForeignKey(Auto, on_delete=models.CASCADE)
    dipendente = models.ForeignKey(Dipendente, on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.tipo_intervento} - {self.auto}"


class TestDrive(models.Model):
    STATO_CHOICES = [
        ('prenotato', 'Prenotato'),
        ('effettuato', 'Effettuato'),
        ('annullato', 'Annullato'),
    ]

    id_test_drive = models.AutoField(primary_key=True)
    data_test_drive = models.DateField()
    stato = models.CharField(max_length=20, choices=STATO_CHOICES, default='prenotato')
    cliente = models.ForeignKey(Cliente, on_delete=models.CASCADE)
    auto = models.ForeignKey(Auto, on_delete=models.CASCADE)
    dipendente = models.ForeignKey(Dipendente, on_delete=models.CASCADE)

    class Meta:
        constraints = [
            models.UniqueConstraint(fields=['cliente', 'auto'], name='unique_testdrive_cliente_auto')
        ]

    def __str__(self):
        return f"Test drive {self.cliente} - {self.auto}"


class Vendita(models.Model):
    id_vendita = models.AutoField(primary_key=True)
    data_vendita = models.DateField()
    cliente = models.ForeignKey(Cliente, on_delete=models.CASCADE)
    auto = models.OneToOneField(Auto, on_delete=models.CASCADE)
    dipendente = models.ForeignKey(Dipendente, on_delete=models.CASCADE)

    def __str__(self):
        return f"Vendita {self.auto} a {self.cliente}"
