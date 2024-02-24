-- Find the names of the customer that are not referred by the customer with id = 2.

SELECT
    name
FROM customer
WHERE
    COALESCE(referee_id, 0) != 2;