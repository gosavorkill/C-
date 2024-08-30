SELECT address, pz.name, count(*)
FROM person_order
JOIN menu m on person_order.menu_id = m.id
JOIN pizzeria pz on m.pizzeria_id = pz.id
JOIN person per on per.id = person_order.person_id
group by address, pz.name
order by address, pz.name;