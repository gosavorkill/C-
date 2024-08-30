--Session #1,2
begin transaction isolation level read committed; -- Начинаем транзакцию с уровнем изоляции чтения READ COMMITTED.
      -- Уровень изоляции READ COMMITTED означает,
      -- что транзакция видит только данные,
      -- которые были зафиксированы (committed),
      -- и не видит изменения, которые были сделаны другими транзакциями, но еще не зафиксированы.
      -- Другими словами, изменения других транзакций не видны в пределах данной транзакции до их фиксации.
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
