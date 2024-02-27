# Write a solution to find the percentage of the users registered in each contest rounded to two decimals.

SELECT
    contest_id
  , ROUND(
            COUNT(DISTINCT r.user_id) * 100
                /
            (
                SELECT
                    COUNT(u.user_id)
                FROM users as u
            )
        , 2) AS percentage
FROM register as r
GROUP BY
    contest_id
ORDER BY
    percentage DESC
  , contest_id