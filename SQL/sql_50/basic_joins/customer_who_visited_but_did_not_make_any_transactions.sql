-- Write a solution to find the IDs of the users who visited without making any transactions and the number of times they made these types of visits.

WITH
    customer_visits_with_no_transactions
        AS (
               SELECT
                   v.visit_id
                 , v.customer_id
               FROM visits AS v
                    LEFT JOIN transactions AS t
                       ON v.visit_id = t.visit_id
               WHERE
                   t.visit_id IS NULL
           )
SELECT
    customer_id
  , COUNT(visit_id) AS count_no_trans
FROM customer_visits_with_no_transactions
GROUP BY
    customer_id;