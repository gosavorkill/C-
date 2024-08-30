CREATE TABLE person_audit
(
    created timestamp with time zone not null default current_timestamp,
    type_event char(1) not null default 'I',
    constraint ch_type_event check (type_event in ('I', 'U', 'D')),
    row_id bigint not null,
    name varchar,
    age integer,
    gender varchar,
    address varchar

);

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit()
RETURNS TRIGGER AS $BODY$
BEGIN
    INSERT INTO person_audit(created, type_event, row_id, name, age, gender, address)
    VALUES (CURRENT_TIMESTAMP, 'I', NEW.id, NEW.name, NEW.age,NEW.gender, NEW.address);
    RETURN NEW;
END;
$BODY$
LANGUAGE plpgsql;
CREATE TRIGGER trg_person_insert_audit
AFTER INSERT ON person
FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_insert_audit();
INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');
select * FROM person_audit;
