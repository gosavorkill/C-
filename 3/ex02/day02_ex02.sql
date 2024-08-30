SELECT coalesce(p.name, '-') AS person_name, visit_date,
       coalesce(pizzeria.name, '-') as pizzeria_name
FROM person p
FULL JOIN (select * from person_visits where visit_date between '2022-01-01' and '2022-01-03')
person_visits on p.id = person_visits.person_id
FULL JOIN pizzeria on pizzeria.id = person_visits.pizzeria_id
ORDER BY person_name, visit_date, pizzeria_name