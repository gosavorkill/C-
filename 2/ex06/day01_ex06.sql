SELECT action_date AS formatted_date,
       p.name AS person_name
FROM (
    SELECT order_date AS action_date, person_id
    FROM person_order
    INTERSECT
    SELECT visit_date AS action_date, person_id
    FROM person_visits
) AS combined_data
JOIN person p ON combined_data.person_id = p.id
ORDER BY action_date, person_name DESC;
