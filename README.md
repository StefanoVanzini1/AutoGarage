# AutoGarage

Sistema informativo per la gestione di una concessionaria automobilistica multi-sede.

**Corso:** Basi di Dati  
**Anno Accademico:** 2025/2026  

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
- Gestione degli interventi di officina
- Consultazione delle recensioni
- Gestione degli utenti in base al ruolo (cliente, venditore, meccanico)

---

## Tecnologie utilizzate

- Python 3
- Django
- MySQL
- HTML5
- CSS3
- Bootstrap 5

---

## Requisiti

- Python 3.12 o superiore
- MySQL Server 8.0 o superiore
- pip, per installare le dipendenze Python
- Git, per clonare la repository

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

- Analisi dei requisiti
- Modello Entità-Relazioni (E-R)
- Schema logico
- Implementazione della base di dati
- Vincoli
- Funzionalità sviluppate
- Analisi degli aspetti di sicurezza

---

## Autori

Progetto realizzato da:

- Stefano Vanzini

Corso di Basi di Dati
Anno Accademico 2025/2026
