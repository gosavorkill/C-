SELECT p.name, COUNT(*) as count_of_visits
from person_visits
JOIN person p on p.id = person_visits.person_id
GROUP BY p.name
ORDEr BY count_of_visits DESC, p.name ASC
limit 4;