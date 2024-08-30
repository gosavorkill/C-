SELECT action_date AS formatted_date,
       person_id
FROM (
    SELECT order_date AS action_date, person_id
    FROM person_order
    INTERSECT
    SELECT visit_date AS action_date, person_id
    FROM person_visits
) AS combined_data
ORDER BY action_date, person_id DESC;