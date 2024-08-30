INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
SELECT ROW_NUMBER() OVER() AS id, person_id, pizzeria_id,
case WHEN COUNT(*) = 1 then 10.5
     WHEN COUNT(*) = 2 then 22
     ELSE 30
END AS discount
FROM person_order join menu on menu.id = person_order.menu_id
GROUP BY person_id, pizzeria_id;
