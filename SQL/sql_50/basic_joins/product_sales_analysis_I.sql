-- Write a solution to report the product_name, year, and price for each sale_id in the Sales table.

SELECT
    p.product_name
  , YEAR
  , price
FROM sales AS s
    LEFT JOIN product AS p
ON s.product_id=p.product_id;