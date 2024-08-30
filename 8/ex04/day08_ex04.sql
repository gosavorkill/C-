--Session #1,2
begin transaction isolation level serializable; -- Начинаем транзакцию с уровнем изоляции SERIALIZABLE.
      -- Уровень изоляции SERIALIZABLE предоставляет самый строгий уровень изоляции в базе данных.
      -- Он гарантирует, что одновременные транзакции не будут видеть изменения данных,
      -- сделанные другими транзакциями, пока эти изменения не будут завершены (зафиксированы).
      -- Это обеспечивает высокую степень изоляции между транзакциями, минимизируя возможность конфликтов
      -- и проблем согласованности данных.
--Session #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Проверка рейтинга.
--Session #2
UPDATE pizzeria SET rating = 3 WHERE name = 'Pizza Hut'; -- Изменение рейтинга.
COMMIT;
--Session #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Проверка рейтинга.
COMMIT;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Проверка рейтинга.
--Session #2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Проверка рейтинга.