--Session #1,2
begin transaction isolation level read committed;
      -- Начинаем транзакцию с уровнем изоляции чтения READ COMMITTED.
--Session #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Проверка рейтинга.
--Session #2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut'; -- Изменение рейтинга.
COMMIT;
--Session #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Проверка рейтинга.
COMMIT;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Проверка рейтинга.
--Session #2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Проверка рейтинга.