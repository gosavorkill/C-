SELECT
    a.id AS person_id,
    a.name AS person_name,
    a.age,
    a.gender,
    a.address,
    b.id AS pizzeria_id,
    b.name AS pizzeria_name,
    b.rating
FROM person a
CROSS JOIN pizzeria b
ORDER BY person_id, pizzeria_id;