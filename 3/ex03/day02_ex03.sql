WITH gen AS (
    SELECT generate_series('2022-01-01', '2022-01-10', interval '1 day')::date AS gen
)
SELECT gen AS missing_date
FROM gen
LEFT JOIN person_visits pv ON gen = pv.visit_date AND (pv.person_id = 1 OR pv.person_id = 2)
WHERE pv.id IS NULL
ORDER BY gen;