-- Write a solution to find the confirmation rate of each user.

WITH
    user_confirmation_rate
        AS (
               SELECT
                   user_id
                 , SUM(IF(action = 'confirmed', 1, 0)) / COUNT(*) AS confirmation_rate
               FROM confirmations
               GROUP BY
                   1
           )
SELECT
    s.user_id
  , ROUND(IFNULL(ucr.confirmation_rate, 0), 2) AS confirmation_rate
FROM signups AS s
     LEFT JOIN user_confirmation_rate AS ucr
        ON s.user_id = ucr.user_id