-- Write a solution to report the customers with postive revenue in the year 2021.

SELECT
    customer_id
FROM customers
WHERE
      year = 2021
  AND revenue > 0;