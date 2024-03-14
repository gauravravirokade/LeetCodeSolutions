-- Write a solution to recommend pages to the user with user_id = 1 using the pages that your friends liked.
-- It should not recommend pages you already liked.

-- Return result table in any order without duplicates.

WITH
    friend_ids
        AS (
               SELECT
                   CASE
                       WHEN user1_id = 1 THEN user2_id
                       WHEN user2_id = 1 THEN user1_id
                   END AS user_id
               FROM friendship
           )
  , recommended_pages
        AS (
               SELECT DISTINCT
                   page_id AS recommended_page
               FROM friend_ids as fi
                        JOIN likes
                            ON fi.user_id = likes.user_id
               WHERE
                   page_id NOT IN (
                                      SELECT
                                          page_id
                                      FROM likes
                                      WHERE
                                          user_id = 1
                                  )
           )
SELECT
    recommended_page
FROM recommended_pages;