COMMENT on TABLE person_discounts IS 'Нахождение скидки';
COMMENT on COLUMN person_discounts.id IS 'Первичный ключ';
COMMENT on COLUMN person_discounts.person_id IS 'Внешний ключ для индентификации person';
COMMENT on COLUMN person_discounts.pizzeria_id IS 'Внешний ключ для индентификации pizzeria';
COMMENT on COLUMN person_discounts.discount IS 'Результат поиска скидки';