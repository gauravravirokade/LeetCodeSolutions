-- Find all numbers that appear at least three times consecutively.

WITH
    cte
        AS (
               SELECT
                   id
                 , num
                 , LAG(num) OVER (ORDER BY id)  AS prev_num
                 , LEAD(num) OVER (ORDER BY id) AS next_num
               FROM logs
           )

SELECT DISTINCT
    num AS consecutivenums
FROM cte
WHERE
      num - next_num = 0
  AND num - prev_num = 0;