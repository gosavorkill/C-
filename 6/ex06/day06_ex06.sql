CREATE SEQUENCE seq_person_discounts STArt 1;
alter TABLE person_discounts ALTER COLUMN id set DEFAULT nextval('seq_person_discounts');
SELECT setval('seq_person_discounts', (SELECT COUNT(*) + 1 from person_discounts));