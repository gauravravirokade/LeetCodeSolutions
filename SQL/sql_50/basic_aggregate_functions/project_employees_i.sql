-- Write an SQL query that reports the average experience years of all the employees for each project, rounded to 2 digits.

WITH
    cte
        AS (
               SELECT
                   p.employee_id
                 , p.project_id
                 , e.experience_years
               FROM project AS p
                    LEFT JOIN employee AS e
                       ON p.employee_id = e.employee_id
           )
SELECT
    project_id
  , ROUND(AVG(experience_years), 2) AS average_years
FROM cte
GROUP BY
    project_id;