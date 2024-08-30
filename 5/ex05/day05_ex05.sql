CREATE UNIQUE INDEX idx_person_order_order_date on person_order(person_id, menu_id)
WHERE order_date = '2022-01-01';
set enable_seqscan = OFF;
EXPLAIN ANALYSE
SELECT menu_id
FROM person_order
WHERE person_id = 1 AND order_date = '2022-01-01';