# Write a solution to find for each date the number of different products sold and their names.
# The sold products names for each date should be sorted lexicographically.

WITH
    cte2
        AS (
               SELECT
                   sell_date
                 , COUNT(DISTINCT product)                         AS num_sold
                 , GROUP_CONCAT(DISTINCT product ORDER BY product) AS products
               FROM activities
               GROUP BY
                   1
           )
SELECT *
FROM cte2;