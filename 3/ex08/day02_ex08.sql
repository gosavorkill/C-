SELECT DISTINCT person.name
FROM person
JOIN person_order ON person_id = person_order.person_id
JOIN menu ON person_order.menu_id = menu_id
WHERE person.gender = 'male'
AND (person.address = 'Moscow' OR person.address = 'Samara')
AND  (menu.pizza_name = 'pepperoni pizza' OR menu.pizza_name = 'mushroom pizza')
ORDER BY person.name DESC;