insert into person_visits (id, person_id, pizzeria_id, visit_date)
values ((SELECT max(id)+1 from person_visits),
        (SELECT id FROM person WHERE name = 'Denis'),
        (SELECT id FROM pizzeria WHERE NAME = 'Dominos'),
        '2022-02-24')
insert into person_visits (id, person_id, pizzeria_id, visit_date)
values ((SELECT max(id)+1 from person_visits),
        (SELECT id FROM person WHERE name = 'Irina'),
        (SELECT id FROM pizzeria WHERE NAME = 'Dominos'),
        '2022-02-24')
