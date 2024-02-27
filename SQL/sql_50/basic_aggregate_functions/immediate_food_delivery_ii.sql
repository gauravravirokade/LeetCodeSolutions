# Write a solution to find the percentage of immediate orders in the first orders of all customers, rounded to 2 decimal places.

WITH
    cte
        AS (
               SELECT
                   customer_id
                 , customer_pref_delivery_date
                 , order_date
                 , FIRST_VALUE(order_date)
                               OVER (PARTITION BY customer_id ORDER BY order_date,delivery_id) AS first_order_date
                 , IF(customer_pref_delivery_date = order_date, "immediate", "scheduled")      AS order_type
               FROM delivery
           )

SELECT
    ROUND(SUM(IF(order_type = 'immediate', 1, 0)) / (COUNT(*)) * 100, 2) AS immediate_percentage
FROM cte
WHERE
    first_order_date = order_date;