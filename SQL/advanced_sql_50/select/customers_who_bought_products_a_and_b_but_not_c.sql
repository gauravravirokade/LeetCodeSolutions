-- Write a solution to report the customer_id and customer_name of customers who bought products "A", "B" but did not buy the product "C" since we want to recommend them to purchase this product.

SELECT DISTINCT
    c.customer_id
  , c.customer_name
FROM customers AS c
     LEFT JOIN orders AS oa
        ON c.customer_id = oa.customer_id
    AND oa.product_name = 'A'
     LEFT JOIN orders AS ob
        ON c.customer_id = ob.customer_id
    AND ob.product_name = 'B'
     LEFT JOIN orders AS oc
        ON c.customer_id = oc.customer_id
    AND oc.product_name = 'C'
WHERE
      oa.customer_id IS NOT NULL
  AND ob.customer_id IS NOT NULL
  AND oc.customer_id IS NULL