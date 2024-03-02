-- Find the IDs of the employees whose salary is strictly less than $30000 and whose manager left the company.
-- When a manager leaves the company, their information is deleted from the Employees table,
-- but the reports still have their manager_id set to the manager that left.

WITH
    managers
        AS (
               SELECT DISTINCT
                   manager_id
               FROM employees
               WHERE
                   manager_id IS NOT NULL
           )
  , employee
        AS (
               SELECT DISTINCT
                   employee_id
               FROM employees
           )
  , left_managers
        AS (
               SELECT
                   m.manager_id
               FROM managers AS m
                    LEFT JOIN employee AS e
                       ON m.manager_id = e.employee_id
               WHERE
                   e.employee_id IS NULL
           )

SELECT
    e.employee_id AS employee_id
FROM employees AS e
     INNER JOIN left_managers AS lm
        ON e.manager_id = lm.manager_id
WHERE
    salary < 30000
ORDER BY
    employee_id