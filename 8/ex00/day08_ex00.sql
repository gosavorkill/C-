--Session #1
BEGIN; -- Начало транзакции.
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut'; -- Изменение рейтинга.
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Проверка изменения рейтинга.
--Session #2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Проверка изменения рейтинга.
-- Заметим, что во втором терминале ничего не изменилось.
--Session #1
COMMIT;
--Session #2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Проверка изменения рейтинга.
-- Заметим, что во втором терминале появилось изменение после коммита.