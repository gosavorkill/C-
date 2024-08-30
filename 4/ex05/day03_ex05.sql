(SELECT p.name AS pizzeria_name
FROM person pr
JOIN person_visits pv ON pr.id = pv.person_id
JOIN pizzeria p ON p.id = pv.pizzeria_id
WHERE pr.name = 'Andrey')

EXCEPT

(SELECT p.name AS pizzeria_name
FROM person pr
JOIN person_order po ON pr.id = po.person_id
JOIN menu on menu.id = po.menu_id
JOIN pizzeria p ON p.id = menu.pizzeria_id
WHERE pr.name = 'Andrey')