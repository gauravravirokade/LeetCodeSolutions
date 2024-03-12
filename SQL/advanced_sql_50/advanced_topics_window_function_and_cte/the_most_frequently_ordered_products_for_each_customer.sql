-- Write a solution to find the most frequently ordered product(s) for each customer.
-- The result table should have the product_id and product_name for each customer_id who ordered at least one order.

WITH
    customer_orders
        AS (  -- get the count of orders for each customer and product
               SELECT
                   customer_id
                 , product_id
                 , COUNT(order_id) AS cnt_orders
               FROM orders
                   customer_id
                 , product_id
           )
  , rank_products
        AS ( -- rank the products for each customer by the count of orders
               SELECT
                   customer_id
                 , product_id
                 , DENSE_RANK() OVER (PARTITION BY customer_id ORDER BY cnt_orders DESC) AS product_rank
               FROM customer_orders
           )
-- get the most frequently ordered product for each customer
SELECT
    rp.customer_id
  , rp.product_id
  , p.product_name
FROM rank_products AS rp
     LEFT JOIN products AS p
        ON rp.product_id = p.product_id
WHERE
    product_rank = 1