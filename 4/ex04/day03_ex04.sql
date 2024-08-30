(SELECT p.name AS pizzeria_name
FROM person pr
JOIN person_order po ON pr.id = po.person_id
JOIN menu on menu.id = po.menu_id
JOIN pizzeria p ON p.id = menu.pizzeria_id
WHERE pr.gender = 'female'


EXCEPT

SELECT p.name AS pizzeria_name
FROM person pr
JOIN person_order po ON pr.id = po.person_id
JOIN menu on menu.id = po.menu_id
JOIN pizzeria p ON p.id = menu.pizzeria_id
WHERE pr.gender = 'male')

UNION

(SELECT p.name AS pizzeria_name
FROM person pr
JOIN person_order po ON pr.id = po.person_id
JOIN menu on menu.id = po.menu_id
JOIN pizzeria p ON p.id = menu.pizzeria_id
WHERE pr.gender = 'male'


EXCEPT

SELECT p.name AS pizzeria_name
FROM person pr
JOIN person_order po ON pr.id = po.person_id
JOIN menu on menu.id = po.menu_id
JOIN pizzeria p ON p.id = menu.pizzeria_id
WHERE pr.gender = 'female')
ORDER BY pizzeria_name;
