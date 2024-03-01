-- Write a solution to find the person_name of the last person that can fit on the bus without exceeding the weight limit.
-- The test cases are generated such that the first person does not exceed the weight limit.

WITH
    cte
        AS (
               SELECT *
                    , SUM(weight) OVER (ORDER BY turn) AS total_weight
               FROM queue
           )
SELECT
    person_name
FROM cte
WHERE
    total_weight = (
                       SELECT
                           MAX(total_weight)
                       FROM cte
                       WHERE
                           total_weight <= 1000
                   );