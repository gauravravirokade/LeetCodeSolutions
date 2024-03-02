-- Write a solution to find the people who have the most friends and the most friends number.

WITH
    users
        AS ( -- get all users from the combination of requester and accepter
               SELECT DISTINCT
                   requester_id AS user_id
               FROM requestaccepted
               UNION
               SELECT DISTINCT
                   accepter_id AS user_id
               FROM requestaccepted
           )
  , users_cross_requests
        AS ( -- cross join users and requestaccepted
               SELECT *
               FROM users
                    CROSS JOIN requestaccepted
           )

  , check_users
        AS ( -- check if the user is in the request
               SELECT
                   user_id                                                   AS id
                 , IF(user_id = requester_id OR user_id = accepter_id, 1, 0) AS is_user_in_this_request
               FROM users_cross_requests
           )
-- count the number of friends for each user
SELECT
    id
  , SUM(is_user_in_this_request) AS num
FROM check_users
GROUP BY
    1
ORDER BY
    2 DESC
LIMIT 1 -- get the user who has the most friends

