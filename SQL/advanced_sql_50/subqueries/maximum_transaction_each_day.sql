-- Write a solution to report the IDs of the transactions with the maximum amount on their respective day.
-- If in one day there are multiple such transactions, return all of them.

-- Return the result table ordered by transaction_id in ascending order.

WITH
    rank_transactions
        AS (
               SELECT
                   day
                 , transaction_id
                 , amount
                 , DENSE_RANK() OVER (PARTITION BY day ORDER BY amount DESC) AS trn_rank
               FROM transactions
           )

SELECT
    transaction_id
FROM rank_transactions
WHERE
    trn_rank = 1
ORDER BY
    transaction_id