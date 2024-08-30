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
    INNER JOIN paths ON paths.point2 = nodes.point1 AND NOT cycle
)
SELECT DISTINCT
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