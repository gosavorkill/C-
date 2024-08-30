(SELECT p.name, COUNT(*) as count, 'visit' as action_type
FROM person_visits join pizzeria p ON p.id = person_visits.pizzeria_id
GROUP BY p.name
ORDER BY count DESC
LIMIT 3)
UNION
(SELECT p.name, COUNT(*) as count, 'order' as action_type
FROM person_order join menu m ON person_order.menu_id = m.id
join pizzeria p ON m.pizzeria_id = p.id
GROUP BY p.name
ORDER BY count DESC
LIMIT 3)
ORDER BY action_type, count DESC