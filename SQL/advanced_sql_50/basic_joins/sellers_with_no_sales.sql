-- Write a solution to report the names of all sellers who did not make any sales in 2020.
-- Return the result table ordered by seller_name in ascending order.

SELECT
    s.seller_name
FROM seller AS s
     LEFT JOIN orders AS o
        ON s.seller_id = o.seller_id
    AND YEAR (sale_date) = '2020'
WHERE
    O.seller_id IS NULL
ORDER BY
    seller_name