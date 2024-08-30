create index  idx_person_discounts_unique on person_discounts(person_id, pizzeria_id);
set enable_seqscan = OFF;
EXPLAIN ANALYSE
SELECT * FROM person_discounts
WHERE person_id = 4 AND pizzeria_id = 5;