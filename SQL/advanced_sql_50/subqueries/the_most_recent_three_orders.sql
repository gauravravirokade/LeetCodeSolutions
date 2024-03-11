-- Write a solution to find the most recent three orders of each user.
-- If a user ordered less than three orders, return all of their orders.

-- Return the result table ordered by customer_name in ascending order and in case of a tie by the customer_id in ascending order.
-- If there is still a tie, order them by order_date in descending order.

WITH
    customer_orders
        AS (
               SELECT
                   customer_id
                 , order_id
                 , order_date
                 , ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date DESC) AS order_rank
               FROM orders
           )
SELECT
    c.name AS customer_name
  , c.customer_id
  , order_id
  , order_date
FROM customer_orders AS co
     LEFT JOIN customers AS c
        ON co.customer_id = c.customer_id
WHERE
    order_rank <= 3
ORDER BY
    customer_name
  , customer_id
  , order_date DESC
