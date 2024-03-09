-- Write a solution to report the latest login for all users in the year 2020.
-- Do not include the users who did not login in 2020.

WITH
    cte
        AS (
               SELECT
                   user_id
                 , MAX(time_stamp) AS last_stamp
               FROM logins
               WHERE
                   EXTRACT(YEAR FROM time_stamp) = 2020
               GROUP BY
                   1
           )
SELECT *
FROM cte;