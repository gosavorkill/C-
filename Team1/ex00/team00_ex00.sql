Create table nodes(point1 varchar, point2 varchar, 
cost numeric);
insert into nodes values ('a', 'b', 10);
insert into nodes values ('b', 'a', 10);
insert into nodes values ('a', 'c', 15);
insert into nodes values ('c', 'a', 15);
insert into nodes values ('a', 'd', 20);
insert into nodes values ('d', 'a', 20);
insert into nodes values ('b', 'c', 35);
insert into nodes values ('c', 'b', 35);
insert into nodes values ('b', 'd', 25);
insert into nodes values ('d', 'b', 25);
insert into nodes values ('c', 'd', 30);
insert into nodes values ('d', 'c', 30);
WiTH q as (
WITH RECURSIVE paths AS (
    SELECT point1,
           point2,
           cost,
           1 AS level,
           ARRAY[point1] AS path,
           FALSE AS cycle,
           ARRAY[cost] AS costs
    FROM nodes
    WHERE point1 = 'a'
    UNION ALL
    SELECT nodes.point1,
           nodes.point2,
           nodes.cost + paths.cost AS cost,
           paths.level + 1 AS level,
           paths.path || nodes.point1 AS path,
           nodes.point1 = ANY(paths.path) AS cycle,
           paths.costs || nodes.cost AS costs
    FROM nodes
    JOIN paths ON paths.point2 = nodes.point1 AND NOT cycle
)
SELECT
       cost - costs[5] AS total_cost,
       path AS tour
FROM paths
WHERE level = 5
  AND 'a' = ANY(path)
  AND 'b' = ANY(path)
  AND 'c' = ANY(path)
  AND 'd' = ANY(path)
  AND path[1] = path[5]
ORDER BY total_cost, tour
)
SELECT DISTINCT total_cost, tour
from q 
WHERE total_cost = (select min (total_cost) from q)
ORDER by total_cost, tour