-- Write a solution to report the number of calls and the total call duration between each pair of distinct persons (person1, person2) where person1 < person2.

SELECT
    LEAST(from_id, to_id)    AS person1
  , GREATEST(from_id, to_id) AS person2
  , COUNT(*)                 AS call_count
  , SUM(duration)            AS total_duration
FROM calls
GROUP BY
    1
  , 2;