CREATE INDEX idx_person_name on person(UPPER(name));

set enable_seqscan = OFF;
EXPLAIN ANALYSE
SELECT * FROM person
WHERE UPPER(name) = 'Anna';