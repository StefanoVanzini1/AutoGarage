# AutoGarage

Sistema informativo per la gestione di una concessionaria automobilistica multi-sede con officina interna.

- **Corso:** Basi di Dati
- **Anno Accademico:** 2025/2026

---

## Descrizione

AutoGarage è un'applicazione web sviluppata nell'ambito del corso di Basi di Dati con l'obiettivo di digitalizzare le principali attività di una concessionaria automobilistica dotata di officina interna.

Il sistema consente di gestire il catalogo delle auto, gli utenti registrati, le prenotazioni dei test drive, le vendite dei veicoli, gli interventi di officina e le recensioni dei clienti.

La concessionaria è organizzata su più sedi territoriali, consentendo la gestione distribuita delle attività di vendita e assistenza.

Il progetto è stato sviluppato utilizzando Django come framework backend e MySQL come sistema di gestione della base di dati.

---

## Funzionalità

L'applicazione implementa le seguenti funzionalità:

* Registrazione e autenticazione degli utenti
* Visualizzazione del catalogo delle auto
* Consultazione della scheda dettagliata di ogni veicolo
* Prenotazione e gestione dei test drive
* Gestione degli interventi di officina
* Consultazione delle recensioni
* Gestione degli utenti in base al ruolo (cliente, venditore, meccanico)

---

## Tecnologie utilizzate

* Python 3
* Django
* MySQL
* HTML5
* CSS3
* Bootstrap 5

---

## Requisiti

* Python 3.12 o superiore
* MySQL Server 8.0 o superiore
* pip, per installare le dipendenze Python
* Git, per clonare la repository

---

## Installazione

### 1. Clonare la repository

```bash
git clone https://github.com/StefanoVanzini1/AutoGarage.git
cd AutoGarage
```

### 2. Creare un ambiente virtuale

```bash
python -m venv .venv
```

### 3. Attivare l'ambiente virtuale

#### Windows

```bash
.venv\Scripts\activate
```

#### Linux

```bash
source .venv/bin/activate
```

#### macOS

```bash
source .venv/bin/activate
```

### 4. Installare le dipendenze

```bash
pip install -r requirements.txt
```

### 5. Configurare il database

Il progetto utilizza MySQL come sistema di gestione della base di dati.

Accedere a MySQL:

```bash
mysql -u root -p
```

Creare un database dedicato al progetto:

```sql
CREATE DATABASE autogarage CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

Uscire da MySQL:

```sql
EXIT;
```

Importare il dump fornito nella repository:

```bash
mysql -u root -p autogarage < dump.sql
```

Successivamente configurare le credenziali di accesso nel file `settings.py`:

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'autogarage',
        'USER': 'root',
        'PASSWORD': 'password',
        'HOST': 'localhost',
        'PORT': '3306',
    }
}
```

I valori di `USER`, `PASSWORD`, `HOST` e `PORT` devono essere adattati alla propria configurazione MySQL.

### 6. Applicare le migrazioni

```bash
python manage.py migrate
```

### 7. Avviare il server

```bash
python manage.py runserver
```

---

## Utilizzo

Una volta avviato il server, aprire il browser all'indirizzo:

```text
http://127.0.0.1:8000/
```

Una volta effettuato l'accesso sarà possibile utilizzare le funzionalità disponibili in base al ruolo associato all'account:

* Cliente: consultazione del catalogo, prenotazione test drive e visualizzazione recensioni.
* Venditore: gestione dei test drive, delle vendite e dei noleggi.
* Meccanico: gestione degli interventi in officina.

---

## Credenziali di test

### Cliente

```text
Email: matteo.serra@email.it
Password: Cliente2026!
```

### Venditore

```text
Email: marco.esposito@autogarage.it
Password: Venditore2026!
```

### Meccanico

```text
Email: antonio.russo@autogarage.it
Password: Meccanico2026!
```

---

## Documentazione

La documentazione completa del progetto è disponibile all'interno della repository e comprende:

* Analisi dei requisiti
* Modello Entità-Relazioni (E-R)
* Schema logico
* Implementazione della base di dati
* Vincoli
* Funzionalità sviluppate
* Analisi degli aspetti di sicurezza

---

## Autore

Progetto sviluppato da:

* Stefano Vanzini

Corso di Basi di Dati
Anno Accademico 2025/2026

