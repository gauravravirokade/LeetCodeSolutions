# Find the largest single NUMBER. If there IS NO single NUMBER, report NULL.

WITH
    num_count
        AS (
               SELECT
                   num
               FROM mynumbers
               GROUP BY
                   num
               HAVING
                   COUNT(num) = 1
           )
SELECT
    MAX(num) AS num
FROM num_count;