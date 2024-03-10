-- Write a solution to find all the pairs (actor_id, director_id) where the actor has cooperated with the director at least three times.

WITH
    collab
        AS (
               SELECT
                   actor_id
                 , director_id
                 , COUNT(*) AS cnt
               FROM actordirector
               GROUP BY
                   1
                 , 2
           )

SELECT
    actor_id
  , director_id
FROM collab
WHERE
    cnt >= 3;