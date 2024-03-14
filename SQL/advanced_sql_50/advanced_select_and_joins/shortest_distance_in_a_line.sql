-- Find the shortest distance between any two points from the Point table.

WITH
    next_points
        AS (
               SELECT
                   x
                 , LEAD(x) OVER (ORDER BY x) AS next_x
               FROM point
           )
SELECT
    MIN(next_x - x) AS shortest
FROM next_points