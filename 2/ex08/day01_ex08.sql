SELECT po.order_date,
       CONCAT(p.name, '(age:', p.age, ')') AS person_name
FROM person_order po
NATURAL JOIN (select p.id as person_id, name, age from person p) as p