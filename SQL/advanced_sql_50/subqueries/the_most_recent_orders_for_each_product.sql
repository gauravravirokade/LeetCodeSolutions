-- Write a solution to find the most recent order(s) of each product.
-- Return the result table ordered by product_name in ascending order and in case of a tie by the product_id in ascending order.
-- If there still a tie, order them by order_id in ascending order.

WITH
    most_recent_order
        AS (
               SELECT
                   product_id
                 , order_id
                 , order_date
                 , DENSE_RANK() AS over(partition BY product_id ORDER BY order_date DESC) AS order_sequence
               FROM orders
           )
SELECT
    p.product_name
  , mro.product_id
  , mro.order_id
  , mro.order_date
FROM most_recent_order AS mro
     LEFT JOIN products AS p
        ON mro.product_id = p.product_id
WHERE
    order_sequence = 1
ORDER BY
    product_name
  , mro.product_id
  , mro.order_id