SELECT name, SUM(count) as total_count
FROM (
    (SELECT p.name, COUNT(*) as count
    FROM person_visits
    JOIN pizzeria p ON p.id = person_visits.pizzeria_id
    GROUP BY p.name)
    UNION ALL
    (SELECT p.name, COUNT(*) as count
    FROM person_order
    JOIN menu m ON person_order.menu_id = m.id
    JOIN pizzeria p ON m.pizzeria_id = p.id
    GROUP BY p.name)
) AS tot
GROUP BY name
ORDER BY total_count DESC;