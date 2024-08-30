--Session #1,2
begin transaction isolation level repeatable read; -- Начинаем транзакцию с уровнем изоляции чтения REPEATABLE READ.
      -- Уровень изоляции REPEATABLE READ гарантирует,
      -- что все чтения данных в рамках транзакции будут
      -- возвращать одинаковый результат в течение всей транзакции.
--Session #1,2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Проверка рейтинга.
--Session #1
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut'; -- Изменение рейтинга.
--Session #2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut'; -- Изменение рейтинга.
--Session #1
COMMIT;
--Session #2
COMMIT;
--Session #1,2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Проверка изменения рейтинга.