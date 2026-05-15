DROP TRIGGER IF EXISTS before_insert_auto;
DROP TRIGGER IF EXISTS before_insert_vendita;
DROP TRIGGER IF EXISTS after_insert_vendita;
DROP TRIGGER IF EXISTS before_insert_testdrive;
DROP TRIGGER IF EXISTS before_insert_intervento;
DROP TRIGGER IF EXISTS before_insert_recensione;

DELIMITER $$

CREATE TRIGGER before_insert_auto
BEFORE INSERT ON garage_auto
FOR EACH ROW
BEGIN
    IF NEW.prezzo <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Errore: il prezzo dell auto deve essere maggiore di 0';
    END IF;

    IF NEW.chilometraggio < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Errore: il chilometraggio non puo essere negativo';
    END IF;

    IF NEW.tipo_auto NOT IN ('nuova', 'usata') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Errore: il tipo auto deve essere nuova o usata';
    END IF;

    IF NEW.stato NOT IN ('disponibile', 'venduta', 'in_manutenzione') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Errore: stato auto non valido';
    END IF;
END$$


CREATE TRIGGER before_insert_vendita
BEFORE INSERT ON garage_vendita
FOR EACH ROW
BEGIN
    DECLARE stato_auto VARCHAR(20);
    DECLARE ruolo_dipendente VARCHAR(20);

    SELECT stato
    INTO stato_auto
    FROM garage_auto
    WHERE id_auto = NEW.auto_id;

    SELECT ruolo
    INTO ruolo_dipendente
    FROM garage_dipendente
    WHERE id_utente = NEW.dipendente_id;

    IF stato_auto <> 'disponibile' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Errore: si puo vendere solo un auto disponibile';
    END IF;

    IF ruolo_dipendente <> 'venditore' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Errore: la vendita deve essere effettuata da un venditore';
    END IF;
END$$


CREATE TRIGGER after_insert_vendita
AFTER INSERT ON garage_vendita
FOR EACH ROW
BEGIN
    UPDATE garage_auto
    SET stato = 'venduta'
    WHERE id_auto = NEW.auto_id;
END$$


CREATE TRIGGER before_insert_testdrive
BEFORE INSERT ON garage_testdrive
FOR EACH ROW
BEGIN
    DECLARE stato_auto VARCHAR(20);
    DECLARE ruolo_dipendente VARCHAR(20);

    SELECT stato
    INTO stato_auto
    FROM garage_auto
    WHERE id_auto = NEW.auto_id;

    SELECT ruolo
    INTO ruolo_dipendente
    FROM garage_dipendente
    WHERE id_utente = NEW.dipendente_id;

    IF stato_auto <> 'disponibile' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Errore: il test drive puo essere prenotato solo per auto disponibili';
    END IF;

    IF ruolo_dipendente <> 'venditore' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Errore: il test drive deve essere gestito da un venditore';
    END IF;
END$$


CREATE TRIGGER before_insert_intervento
BEFORE INSERT ON garage_intervento
FOR EACH ROW
BEGIN
    DECLARE ruolo_dipendente VARCHAR(20);

    SELECT ruolo
    INTO ruolo_dipendente
    FROM garage_dipendente
    WHERE id_utente = NEW.dipendente_id;

    IF ruolo_dipendente <> 'meccanico' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Errore: l intervento deve essere effettuato da un meccanico';
    END IF;

    IF NEW.costo < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Errore: il costo dell intervento non puo essere negativo';
    END IF;
END$$


CREATE TRIGGER before_insert_recensione
BEFORE INSERT ON garage_recensione
FOR EACH ROW
BEGIN
    DECLARE numero_vendite INT DEFAULT 0;
    DECLARE numero_testdrive INT DEFAULT 0;

    IF NEW.voto < 1 OR NEW.voto > 5 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Errore: il voto della recensione deve essere compreso tra 1 e 5';
    END IF;

    SELECT COUNT(*)
    INTO numero_vendite
    FROM garage_vendita
    WHERE cliente_id = NEW.cliente_id
      AND auto_id = NEW.auto_id;

    SELECT COUNT(*)
    INTO numero_testdrive
    FROM garage_testdrive
    WHERE cliente_id = NEW.cliente_id
      AND auto_id = NEW.auto_id
      AND stato = 'effettuato';

    IF numero_vendite = 0 AND numero_testdrive = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Errore: il cliente puo recensire solo auto acquistate o provate';
    END IF;
END$$

DELIMITER ;