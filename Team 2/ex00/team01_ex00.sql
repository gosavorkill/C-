WITH user_volume
         AS (SELECT COALESCE(u.name, 'not defined') as name,
                    COALESCE(u.lastname, 'not defined') as lastname,
                    b.type,
                    SUM(b.money) AS volume,
                    b.currency_id
             FROM "user" As u
                      FULL JOIN balance AS b ON u.id = b.user_id
             GROUP BY b.type, 
					COALESCE(u.lastname, 'not defined'), 
					COALESCE(u.name, 'not defined'), 
					  currency_id),
	  balance_currency
         AS (SELECT uv.name,
                    uv.lastname,
                    uv.type,
                    uv.volume,
                    COALESCE(cur.name, 'not defined') AS currency_name,
                    uv.currency_id
             FROM user_volume AS uv
                      LEFT JOIN currency AS cur ON cur.id = uv.currency_id
             GROUP BY uv.name,
                      uv.lastname,
                      uv.type,
                      uv.volume,
                      COALESCE(cur.name, 'not defined'),
                      uv.currency_id),
	  rate
         AS (SELECT currency.id,
                    name,
                    rate_to_usd,
                    lastdate
             FROM (SELECT id,
                          MAX(updated) AS lastdate
                   FROM currency
                   GROUP BY 1) q1
                      LEFT JOIN currency ON q1.lastdate = currency.updated 
						AND q1.id = currency.id)

SELECT balance_currency.name       AS name,
       lastname                    AS lastname,
       type,
       volume,
       currency_name,
       COALESCE(rate_to_usd, 1)               AS last_rate_to_usd,
       COALESCE(volume * rate_to_usd, volume) AS total_volume_in_usd
FROM balance_currency
         LEFT JOIN rate ON rate.id = balance_currency.currency_id
ORDER BY name DESC, lastname ASC, type ASC;