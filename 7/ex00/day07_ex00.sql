SELECT person_id, COUNT(*) as count_of_visits
from person_visits
GROUP BY person_id
ORDEr BY count_of_visits DESC, person_id ASC;