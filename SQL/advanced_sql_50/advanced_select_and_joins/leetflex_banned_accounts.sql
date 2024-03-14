-- Write a solution to find the account_id of the accounts that should be banned from Leetflex.
-- An account should be banned if it was logged in at some moment from two different IP addresses.

WITH
    cte
        AS (
               SELECT
                   l.account_id
               FROM loginfo AS l
                    LEFT JOIN loginfo AS l1
                       ON l.account_id = l1.account_id
               WHERE
                     (l.login BETWEEN l1.login AND l1.logout
                         OR l1.login BETWEEN l.login AND l.logout)
                 AND l.ip_address != l1.ip_address
           )

SELECT DISTINCT
    account_id
FROM cte;