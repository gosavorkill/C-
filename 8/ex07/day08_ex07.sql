--Session #1,2
begin; -- Начинаем транзакцию.
--Session #1
UPDATE pizzeria SET rating = 5 WHERE id = 1; -- Изменение рейтинга.
--Session #2
UPDATE pizzeria SET rating = 4 WHERE id = 2; -- Изменение рейтинга.
--Session #1
UPDATE pizzeria SET rating = 5 WHERE id = 2; -- Изменение рейтинга.
--Session #2
UPDATE pizzeria SET rating = 4 WHERE id = 1; -- Изменение рейтинга.
--Session #1
COMMIT;
--Session #2
COMMIT;



