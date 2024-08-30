SELECT p.name, m.pizza_name, m.price, ROUND((m.price-(M.price * d.discount/100)), 2) AS discount_price,
pz.name as pizza_name
FROM person_order
JOIN menu m on m.id= person_order.menu_id
JOIN person p on p.id = person_order.person_id
JOIN person_discounts d ON p.id = d.person_id AND d.pizzeria_id = m.pizzeria_id
JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY p.name, m.pizza_name;