-- Write a solution to find the team size of each of the employees.
-- Return the result table in any order.

WITH
    team_size
        AS (
               SELECT
                   team_id
                 , COUNT(employee_id) AS cnt_employees
               FROM employee
               GROUP BY
                   1
           )
SELECT
    e.employee_id
  , ts.cnt_employees AS team_size
FROM employee AS e
     LEFT JOIN team_size AS ts
        ON e.team_id = ts.team_id
