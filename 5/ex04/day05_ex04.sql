CREATE UNIQUE INDEX idx_menu_unique on menu(pizzeria_id, pizza_name);
set enable_seqscan = OFF;
EXPLAIN ANALYSE
SELECT pizzeria_id, pizza_name, ID
FROM menu
WHERE pizzeria_id = 5 AND pizza_name = 'supreme pizza';
