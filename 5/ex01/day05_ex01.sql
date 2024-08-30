set enable_seqscan = OFF;
EXPLAIN ANALYSE
SELECT m.pizza_name, p.name AS pizzeria_name
FROM menu m
JOIN pizzeria p ON m.pizzeria_id = p.id;