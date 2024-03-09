-- Write a solution to report the difference between the number of apples and oranges sold each day.

WITH
    apples_sold
        AS (
               SELECT
                   sale_date
                 , sold_num
               FROM sales
               WHERE
                   fruit = 'apples'
           )

  , oranges_sold
        AS (
               SELECT
                   sale_date
                 , sold_num
               FROM sales
               WHERE
                   fruit = 'oranges'
           )
SELECT
    aps.sale_date
  , aps.sold_num - os.sold_num AS diff
FROM apples_sold AS aps
     LEFT JOIN oranges_sold AS os
        ON aps.sale_date = os.sale_date
ORDER BY
    1
