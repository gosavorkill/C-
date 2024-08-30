SELECT p.name , p.rating
FROM pizzeria p
LEFT JOIN person_visits v ON p.id = v.pizzeria_id
WHERE v.pizzeria_id IS NULL