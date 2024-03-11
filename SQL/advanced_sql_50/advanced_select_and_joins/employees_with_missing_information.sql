-- Write a solution to report the IDs of all the employees with missing information.
-- The information of an employee is missing if:
--     The employee's name is missing, or
--     The employee's salary is missing.
-- Return the result table ordered by employee_id in ascending order.

WITH
    employee_information
        AS (
               SELECT DISTINCT
                   COALESCE(e.employee_id, s.employee_id) AS employee_id
               FROM employees AS e
                    FULL JOIN salaries AS s
                       ON e.employee_id = s.employee_id
               WHERE
                    e.name IS NULL
                 OR s.salary IS NULL
               ORDER BY
                   1
           )
SELECT *
FROM employee_information