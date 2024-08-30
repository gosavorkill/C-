--Session #1,2
begin transaction isolation level read committed;
-- Начинаем транзакцию с уровнем изоляции чтения READ COMMITTED.
--Session #1
SELECT sum(rating) FROM pizzeria; -- Проверка суммы рейтинга.
--Session #2
UPDATE pizzeria SET rating = 1 WHERE name = 'Pizza Hut'; -- Изменение рейтинга.
COMMIT;
--Session #1
SELECT sum(rating) FROM pizzeria; -- Проверка суммы рейтинга.
COMMIT;
SELECT sum(rating) FROM pizzeria; -- Проверка суммы рейтинга.
--Session #2
SELECT sum(rating) FROM pizzeria; -- Проверка суммы рейтинга.


