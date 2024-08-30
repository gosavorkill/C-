SELECT p.name, count(*) as count_of_visits
FROM person_visits join person p ON p.id = person_visits.person_id
GROUP BY p.name
HAVING COUNT(*) > 3;