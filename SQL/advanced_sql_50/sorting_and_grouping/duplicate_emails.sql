-- Write a solution to report all the duplicate emails.
-- Note that it's guaranteed that the email field is not NULL.

WITH
    rank_email
        AS (
               SELECT
                   email
                 , COUNT(*) AS cnt
               FROM person
               GROUP BY
                   email
           )
SELECT
    email
FROM rank_email
WHERE
    cnt != 1;