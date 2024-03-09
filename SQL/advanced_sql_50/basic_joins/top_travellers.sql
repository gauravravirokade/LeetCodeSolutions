-- Write a solution to report the distance traveled by each user.
-- Return the result table ordered by travelled_distance in descending order, if two or more users traveled the same distance, order them by their name in ascending order.

SELECT
    u.name
  , COALESCE(SUM(distance), 0) AS travelled_distance
FROM users AS u
     LEFT JOIN rides AS r
        ON r.user_id = u.id
GROUP BY
    1
  , u.id
ORDER BY
    2 DESC
  , 1