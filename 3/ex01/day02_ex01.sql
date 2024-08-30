SELECT gen::date as missing_date
FROM (SELECT * FROM person_visits pv WHERE person_id = 1 or person_id = 2) as pv
RIGHT JOIN generate_series('2022-01-01', '2022-01-10', interval '1 day') as gen on pv.visit_date = gen
WHERE pv.id IS NULL
order by gen