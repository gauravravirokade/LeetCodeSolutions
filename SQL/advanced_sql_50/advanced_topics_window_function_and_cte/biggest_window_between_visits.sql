-- Assume today's date is '2021-1-1'.
-- Write a solution that will, for each user_id, find out the largest window of days between each visit and the one right after it (or today if you are considering the last visit).
-- Return the result table ordered by user_id.

WITH
    users_next_visit
        AS ( -- get the next visit date for each user
               SELECT
                   user_id
                 , visit_date
                 , LEAD(visit_date) OVER (PARTITION BY user_id ORDER BY visit_date) AS next_visit_date
               FROM uservisits
           )
  , impute_next_visit
        AS ( -- if the next visit is NULL, impute it with today's date '2021-1-1'
               SELECT
                   user_id
                 , visit_date
                 , CASE
                       WHEN
                           visit_date::TIMESTAMP < '2021-1-1':: TIMESTAMP AND next_visit_date IS NULL
                           THEN '2021-1-1'
                       ELSE next_visit_date
                   END AS imputed_next_visit_date
               FROM users_next_visit
           )
  , window_between_visits
        AS ( -- get the days window between each visit and the next one
               SELECT
                   user_id
                 , DATE_PART('day', imputed_next_visit_date::TIMESTAMP - visit_date::TIMESTAMP) AS days_window
               FROM impute_next_visit
           )
-- get the biggest window for each user
SELECT
    user_id
  , MAX(days_window) AS biggest_window
FROM window_between_visits
GROUP BY
    user_id
ORDER BY
    user_id