insert into menu (id, pizzeria_id, pizza_name, price)
values ((SELECT max(id)+1 from menu), (SELECT id FROM pizzeria WHERE NAME = 'Dominos'), 'Sicilian pizza', '900')