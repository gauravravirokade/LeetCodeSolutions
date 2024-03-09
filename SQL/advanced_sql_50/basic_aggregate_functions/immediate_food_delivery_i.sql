-- If the customer's preferred delivery date is the same as the order date, then the order is called immediate; otherwise, it is called scheduled.
-- Write a solution to find the percentage of immediate orders in the table, rounded to 2 decimal places.

WITH
    cte
        AS (
               SELECT
                   delivery_id
                 , CASE
                       WHEN order_date = customer_pref_delivery_date
                           THEN 1
                       ELSE 0
                   END AS delivery_preference
               FROM delivery
           )
SELECT
    ROUND(SUM(delivery_preference)::decimal / COUNT(*) * 100, 2) AS immediate_percentage
FROM cte;