SELECT m.pizza_name, p1.name AS pizzeria_name_1, p2.name AS pizzeria_name_2, m.price
FROM menu m
JOIN menu m2 ON m.id <> m2.id
AND m.price = m2.price
AND m.pizzeria_id > m2.pizzeria_id
AND m.pizza_name = m2.pizza_name
JOIN pizzeria p1 on m.pizzeria_id = p1.id
JOIN pizzeria p2 ON m2.pizzeria_id = p2.id
ORDER BY m.pizza_name