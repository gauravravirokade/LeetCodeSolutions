-- Write a solution to find employees who have the highest salary in each of the departments.
-- Return the result table in any order.

WITH
    salary_by_departments
        AS (
               SELECT
                   e.name       AS employee
                 , e.salary
                 , d.name       AS department
                 , dense_rank() AS over (partition BY d.name ORDER BY e.salary DESC) AS salary_rank
               FROM employee AS e
                    LEFT JOIN department AS d
                       ON e.departmentid = d.id
           )
SELECT
    department
  , employee
  , salary
FROM salary_by_departments
WHERE
    salary_rank = 1
