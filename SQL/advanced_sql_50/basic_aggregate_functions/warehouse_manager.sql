-- Write a solution to report the number of cubic feet of volume the inventory occupies in each warehouse.

WITH
    cte
        AS (
               SELECT
                   w.name
                 , w.product_id
                 , (p.width * p.length * p.height) * w.units AS volume_per_product
               FROM warehouse AS w
                    LEFT JOIN products AS p
                       ON w.product_id = p.product_id
           )

SELECT
    name                    AS warehouse_name
  , SUM(volume_per_product) AS volume
FROM cte
GROUP BY
    1;
