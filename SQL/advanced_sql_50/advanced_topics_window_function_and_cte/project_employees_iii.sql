-- Write a solution to report the most experienced employees in each project.
-- In case of a tie, report all employees with the maximum number of experience years.

WITH
    rank_employees
        AS (
               SELECT
                   p.project_id
                 , p.employee_id
                 , DENSE_RANK() OVER (PARTITION BY p.project_id ORDER BY e.experience_years DESC) AS employee_rank
               FROM project AS p
                    LEFT JOIN employee AS e
                       ON p.employee_id = e.employee_id
           )

SELECT
    project_id
  , employee_id
FROM rank_employees
WHERE
    employee_rank = 1

