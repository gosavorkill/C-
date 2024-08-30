-- insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
-- insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH cur_with_bal AS (SELECT b.user_id     AS bal_ui,
                            b.money,
                            b.updated,
                            cur.name        AS cur_name,
                            cur.rate_to_usd AS cur_rate,
                            cur.updated     AS cur_updated
                 FROM balance as b
                          JOIN currency as cur
                               ON b.currency_id = cur.id),

     all_join AS (SELECT t2.id, 
                         t2.cur_name, 
                         t2.money, 
                         t2.updated, 
                         COALESCE(t1.diff, t2.diff) new_diff -- значит, t1 нет, вставляю ближайший из будущего
                  FROM (SELECT cur_with_bal.bal_ui AS id, 
                        cur_name,
                        money, 
                        updated, 
                        MIN(updated - cur_updated) AS diff -- разница обновлений курса
                        FROM cur_with_bal
                        WHERE updated - cur_updated > INTERVAL '0 days' -- если разница в обновлении есть 
                        GROUP BY 1, 2, 3, 4) AS t1 -- с картинки
                              FULL JOIN (SELECT cur_with_bal.bal_ui    AS id,
                                             cur_name,
                                             money,
                                             updated,
                                             MAX(updated - cur_updated) AS diff
                                      FROM cur_with_bal
                                      WHERE updated - cur_updated < INTERVAL '0 days' -- если разницы в обновлении нет
                                      GROUP BY 1, 2, 3, 4) AS t2 -- с картинки
                              ON t1.id = t2.id 
                              AND t1.cur_name = t2.cur_name 
                              AND t1.money = t2.money 
                              AND t1.updated = t2.updated)

SELECT COALESCE(u.name, 'not defined'),
       COALESCE(u.lastname, 'not defined'),
       aj.cur_name,
       aj.money * cur.rate_to_usd AS currency_in_usd
FROM all_join AS aj
         LEFT JOIN "user" as u ON aj.id = u.id
         LEFT JOIN currency as cur ON aj.new_diff = (aj.updated - cur.updated) 
                                   AND aj.cur_name = cur.name
ORDER BY 1 DESC, 2 ASC, 3 ASC;