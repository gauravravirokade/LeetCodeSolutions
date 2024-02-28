-- Write a solution to report the customer ids from the Customer table that bought all the products in the Product table.

WITH
    cte
        AS (
               SELECT
                   customer_id
                 , COUNT(DISTINCT product_key) AS cnt
               FROM customer
               GROUP BY
                   1
               HAVING
                   cnt = (
                             SELECT
                                 COUNT(*)
                             FROM product
                         )
           )

SELECT
    customer_id
FROM cte;