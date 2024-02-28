-- Write a solution that will, for each user, return the number of followers.

SELECT
    user_id
  , COUNT(follower_id) AS followers_count
FROM followers
GROUP BY
    1
ORDER BY
    1