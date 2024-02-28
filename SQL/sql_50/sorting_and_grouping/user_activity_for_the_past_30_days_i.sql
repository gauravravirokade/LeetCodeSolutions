-- Write a solution to find the daily active user count for a period of 30 days ending 2019-07-27 inclusively.
-- A user was active on someday if they made at least one activity on that day.

SELECT
    activity_date           AS day
  , COUNT(DISTINCT user_id) AS active_users
FROM activity
GROUP BY
    1
HAVING
    activity_date BETWEEN '2019-06-28' AND '2019-07-27';
