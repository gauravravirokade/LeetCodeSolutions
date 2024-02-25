-- Write a solution to show the unique ID of each user, If a user does not have a unique ID replace just show null.

SELECT
    COALESCE(eu.unique_id, NULL) AS unique_id
  , e.name
FROM employees AS e
     LEFT JOIN employeeuni AS eu
        ON e.id = eu.id