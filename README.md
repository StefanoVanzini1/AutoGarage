# AutoGarage

Sistema informativo per la gestione di una concessionaria automobilistica con officina interna.

**Corso:** Basi di Dati  
**Anno Accademico:** 2025/2026  
**Tecnologie:** Django, MySQL, Bootstrap

---

## Descrizione

AutoGarage è un'applicazione web sviluppata nell'ambito del corso di Basi di Dati con l'obiettivo di digitalizzare le principali attività di una concessionaria automobilistica dotata di officina interna.

Il sistema consente di gestire il catalogo delle auto, gli utenti registrati, le prenotazioni dei test drive, le vendite dei veicoli, gli interventi di officina e le recensioni dei clienti.

Il progetto è stato sviluppato utilizzando Django come framework backend e MySQL come sistema di gestione della base di dati.

---

## Funzionalità

L'applicazione implementa le seguenti funzionalità:

- Registrazione e autenticazione degli utenti
- Visualizzazione del catalogo delle auto
- Consultazione della scheda dettagliata di ogni veicolo
- Prenotazione e gestione dei test drive
- Registrazione delle vendite
- Gestione degli interventi di officina
- Inserimento e consultazione delle recensioni
- Gestione degli utenti in base al ruolo (cliente, venditore, meccanico)

---

## Tecnologie utilizzate

- Python 3
- Django
- MySQL
- HTML5
- CSS3
- Bootstrap 5
- Git
- GitHub

---

## Requisiti

Il progetto è stato testato sui seguenti sistemi operativi:

- Windows 10 / 11
- Linux
- macOS

Software richiesto:

- Python 3.12 o superiore
- MySQL Server 8.0 o superiore
- pip
- Git

---

## Installazione

### 1. Clonare la repository

```bash
git clone https://github.com/NOME-UTENTE/AutoGarage.git
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

Creare un database MySQL e configurare le credenziali di accesso nel file `settings.py`.

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

L'applicazione è accessibile da qualsiasi browser moderno, tra cui:

- Google Chrome
- Mozilla Firefox
- Microsoft Edge
- Safari

Da qui sarà possibile:

- effettuare il login;
- registrare nuovi utenti;
- consultare il catalogo delle auto;
- prenotare test drive;
- gestire vendite e interventi tramite gli account dedicati.

---

## Credenziali di test

### Amministratore

```text
Email: admin@autogarage.it
Password: ********
```

### Venditore

```text
Email: venditore@autogarage.it
Password: ********
```

### Meccanico

```text
Email: meccanico@autogarage.it
Password: ********
```

---

## Documentazione

La documentazione completa del progetto è disponibile all'interno della repository e comprende:

- Analisi dei requisiti
- Modello Entità-Relazioni (E-R)
- Schema logico
- Implementazione della base di dati
- Vincoli e trigger
- Funzionalità sviluppate
- Analisi degli aspetti di sicurezza
- Test effettuati

---

## Struttura del progetto

```text
AutoGarage/
│
├── garage/
├── templates/
├── static/
├── media/
├── documentazione/
├── manage.py
├── requirements.txt
└── README.md
```

---

## Autori

Progetto realizzato per il corso di **Basi di Dati**.

Anno Accademico 2025/2026.
