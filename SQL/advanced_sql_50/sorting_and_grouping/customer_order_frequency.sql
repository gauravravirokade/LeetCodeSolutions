-- Write a solution to report the customer_id and customer_name of customers who have spent at least $100 in each month of June and July 2020.

SELECT
    customer_id
  , name
FROM customers
     JOIN orders
        USING (customer_id)
     JOIN product
        USING (product_id)
GROUP BY
    customer_id
HAVING
      SUM(IF(LEFT(order_date, 7) = '2020-06', quantity, 0) * price) >= 100
  AND SUM(IF(LEFT(order_date, 7) = '2020-07', quantity, 0) * price) >= 100