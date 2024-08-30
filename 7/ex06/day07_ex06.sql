SELECT p.name, count(*) as count_of_orders, round(avg(m.price),2) as average_price, max(m.price) as max_price,
       min(m.price) as min_price
FROM person_order
JOIN menu m ON person_order.menu_id = m.id
JOIN pizzeria p ON m.pizzeria_id = p.id
group by p.name
order by p.name

SELECT * FROM person_order
SELECT * FROM menu
SELECT * FROM pizzeria