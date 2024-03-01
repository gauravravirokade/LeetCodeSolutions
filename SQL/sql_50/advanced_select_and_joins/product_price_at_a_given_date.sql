-- Write a solution to find the prices of all products on 2019-08-16.
-- Assume the price of all products before any change is 10.

WITH
    cte
        AS (
               SELECT
                   product_id
                 , new_price
                 , change_date           AS valid_from
                 , COALESCE(
                           DATE_ADD(
                                   LEAD(change_date) OVER (PARTITION BY product_id ORDER BY change_date)
                               , INTERVAL -1 DAY)
                       , CURRENT_DATE()) AS valid_to
               FROM products
           )
  , product_price
        AS (
               SELECT
                   product_id
                 , new_price AS price
               FROM cte
               WHERE
                   '2019-08-16' BETWEEN valid_from AND valid_to
           )

  , default_price
        AS (
               SELECT
                   product_id
                 , 10 AS price
               FROM products
               WHERE
                   product_id NOT IN (
                                         SELECT
                                             product_id
                                         FROM product_price
                                     )
           )

SELECT *
FROM product_price
UNION
SELECT *
FROM default_price
;
