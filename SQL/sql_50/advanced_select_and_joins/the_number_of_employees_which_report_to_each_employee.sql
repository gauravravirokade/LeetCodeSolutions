-- Write a solution to report the ids and the names of all managers,
-- the number of employees who report directly to them, and the average age of the reports rounded to the nearest integer.
-- Return the result table ordered by employee_id.

WITH
    manager_reportees
        AS (
               SELECT
                   reports_to
                 , COUNT(*)           AS reports_count
                 , ROUND(AVG(age), 0) AS average_age
               FROM employees
               GROUP BY
                   1
               HAVING
                   reports_to IS NOT NULL
           )
SELECT
    mr.reports_to AS employee_id
  , e.name
  , mr.reports_count
  , mr.average_age
FROM manager_reportees AS mr
     INNER JOIN employees AS e
        ON mr.reports_to = e.employee_id
ORDER BY
    mr.reports_to
