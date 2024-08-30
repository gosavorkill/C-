(SELECT p.name AS pizzeria_name
FROM person pr
JOIN person_visits pv ON pr.id = pv.person_id
JOIN pizzeria p ON p.id = pv.pizzeria_id
WHERE pr.gender = 'female'

EXCEPT ALL

SELECT p.name AS pizzeria_name
FROM person pr
JOIN person_visits pv ON pr.id = pv.person_id
JOIN pizzeria p ON p.id = pv.pizzeria_id
WHERE pr.gender = 'male'
)

UNION ALL

(SELECT p.name AS pizzeria_name
FROM person pr
JOIN person_visits pv ON pr.id = pv.person_id
JOIN pizzeria p ON p.id = pv.pizzeria_id
WHERE pr.gender = 'male'

EXCEPT ALL

SELECT p.name AS pizzeria_name
FROM person pr
JOIN person_visits pv ON pr.id = pv.person_id
JOIN pizzeria p ON p.id = pv.pizzeria_id
WHERE pr.gender = 'female'
)
ORDER BY pizzeria_name;