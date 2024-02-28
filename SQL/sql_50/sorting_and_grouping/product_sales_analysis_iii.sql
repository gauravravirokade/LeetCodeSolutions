-- Write a solution to select the product id, year, quantity, and price for the first year of every product sold.

WITH
    products_first_year
        AS (
               SELECT
                   product_id
                 , MIN(YEAR) AS first_year
               FROM sales
               GROUP BY
                   1
           )
SELECT
    s.product_id
  , s.year AS first_year
  , s.quantity
  , s.price
FROM sales AS s
     INNER JOIN products_first_year AS pfy
        ON s.product_id = pfy.product_id
    AND s.year = pfy.first_year