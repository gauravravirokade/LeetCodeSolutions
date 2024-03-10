-- Write a solution to report the name and balance of users with a balance higher than 10000.
-- The balance of an account is equal to the sum of the amounts of all transactions involving that accoun

WITH
    account_balance
        AS (
               SELECT
                   name
                 , SUM(amount) AS balance
               FROM transactions AS t
                    LEFT JOIN users AS u
                       ON t.account = u.account
               GROUP BY
                   1
           )

SELECT *
FROM account_balance
WHERE
    balance > 10000;