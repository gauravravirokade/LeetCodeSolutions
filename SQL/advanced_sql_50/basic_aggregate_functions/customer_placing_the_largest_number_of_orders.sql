-- Write a solution to find the customer_number for the customer who has placed the largest number of orders.

WITH
    customer_orders
        AS (
               SELECT
                   customer_number
                 , COUNT(order_number) AS cnt_orders
               FROM orders
               GROUP BY
                   1
               ORDER BY
                   2 DESC
           )
SELECT
    customer_number
FROM customer_orders
LIMIT 1
