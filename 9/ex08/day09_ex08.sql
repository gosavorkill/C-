CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop integer default 10)
       RETURNS TABLE (q bigint) AS $$
       WITH RECURSIVE fib (q, w) AS
       (SELECT 0 AS q, 1 AS w
       UNION ALL
       SELECT w, q+w FROM fib WHERE w<pstop)
       SELECT q
       FROM fib;
$$ LANGUAGE SQL;