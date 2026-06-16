DROP TRIGGER IF EXISTS before_insert_vendita;
DROP TRIGGER IF EXISTS after_insert_vendita;
DROP TRIGGER IF EXISTS before_insert_noleggio;
DROP TRIGGER IF EXISTS before_insert_testdrive;
DROP TRIGGER IF EXISTS before_insert_intervento;
DROP TRIGGER IF EXISTS before_insert_recensione;
DROP TRIGGER IF EXISTS before_insert_impiego;

DELIMITER $$

CREATE TRIGGER before_insert_vendita
BEFORE INSERT ON garage_vendita
FOR EACH ROW
BEGIN
    DECLARE ruolo_cliente VARCHAR(20);
    DECLARE ruolo_venditore VARCHAR(20);
    DECLARE stato_auto VARCHAR(20);

    SELECT ruolo INTO ruolo_cliente
    FROM garage_utente
    WHERE id = NEW.cliente_id;

    SELECT ruolo INTO ruolo_venditore
    FROM garage_utente
    WHERE id = NEW.venditore_id;

    SELECT stato INTO stato_auto
    FROM garage_auto
    WHERE id = NEW.auto_id;

    IF ruolo_cliente <> 'cliente' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Errore: solo un cliente puo acquistare un auto';
    END IF;

    IF ruolo_venditore <> 'venditore' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Errore: la vendita deve essere gestita da un venditore';
    END IF;

    IF stato_auto <> 'disponibile' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Errore: si puo vendere solo un auto disponibile';
    END IF;
END$$


CREATE TRIGGER after_insert_vendita
AFTER INSERT ON garage_vendita
FOR EACH ROW
BEGIN
    UPDATE garage_auto
    SET stato = 'venduta'
    WHERE id = NEW.auto_id;
END$$


CREATE TRIGGER before_insert_noleggio
BEFORE INSERT ON garage_noleggio
FOR EACH ROW
BEGIN
    DECLARE ruolo_cliente VARCHAR(20);
    DECLARE ruolo_venditore VARCHAR(20);

    SELECT ruolo INTO ruolo_cliente
    FROM garage_utente
    WHERE id = NEW.cliente_id;

    SELECT ruolo INTO ruolo_venditore
    FROM garage_utente
    WHERE id = NEW.venditore_id;

    IF ruolo_cliente <> 'cliente' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Errore: solo un cliente puo effettuare un noleggio';
    END IF;

    IF ruolo_venditore <> 'venditore' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Errore: il noleggio deve essere gestito da un venditore';
    END IF;
END$$


CREATE TRIGGER before_insert_testdrive
BEFORE INSERT ON garage_testdrive
FOR EACH ROW
BEGIN
    DECLARE ruolo_cliente VARCHAR(20);
    DECLARE ruolo_venditore VARCHAR(20);

    SELECT ruolo INTO ruolo_cliente
    FROM garage_utente
    WHERE id = NEW.cliente_id;

    SELECT ruolo INTO ruolo_venditore
    FROM garage_utente
    WHERE id = NEW.venditore_id;

    IF ruolo_cliente <> 'cliente' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Errore: solo un cliente puo effettuare un test drive';
    END IF;

    IF ruolo_venditore <> 'venditore' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Errore: il test drive deve essere gestito da un venditore';
    END IF;
END$$


CREATE TRIGGER before_insert_intervento
BEFORE INSERT ON garage_intervento
FOR EACH ROW
BEGIN
    DECLARE ruolo_meccanico VARCHAR(20);

    SELECT ruolo INTO ruolo_meccanico
    FROM garage_utente
    WHERE id = NEW.meccanico_id;

    IF ruolo_meccanico <> 'meccanico' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Errore: l intervento deve essere effettuato da un meccanico';
    END IF;
END$$


CREATE TRIGGER before_insert_recensione
BEFORE INSERT ON garage_recensione
FOR EACH ROW
BEGIN
    DECLARE ruolo_cliente VARCHAR(20);

    SELECT ruolo INTO ruolo_cliente
    FROM garage_utente
    WHERE id = NEW.cliente_id;

    IF ruolo_cliente <> 'cliente' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Errore: solo un cliente puo scrivere una recensione';
    END IF;
END$$


CREATE TRIGGER before_insert_impiego
BEFORE INSERT ON garage_impiego
FOR EACH ROW
BEGIN
    DECLARE ruolo_dipendente VARCHAR(20);

    SELECT ruolo INTO ruolo_dipendente
    FROM garage_utente
    WHERE id = NEW.dipendente_id;

    IF ruolo_dipendente NOT IN ('venditore', 'meccanico') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Errore: solo venditori e meccanici possono essere impiegati in una sede';
    END IF;
END$$

DELIMITER ;