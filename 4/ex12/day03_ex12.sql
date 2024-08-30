INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT
X+(SELECT max(id) from person_order) as id,
id as person_id,
(SELECT id from menu where pizza_name = 'greek pizza') as menu_id,
'2022-02-25' as order_date
FROM person
JOIN generate_series(1, (SELECT COUNT(*) from person)) as x on x = person.id