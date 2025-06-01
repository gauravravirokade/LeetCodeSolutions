-- Write your PostgreSQL query statement below
WITH
    cte AS (SELECT
                *
              , ROW_NUMBER() OVER (PARTITION BY company ORDER BY salary) AS rn
              , COUNT(salary) OVER (PARTITION BY company)                AS total_employees
            FROM
                employee)

SELECT
    id
  , company
  , salary
FROM
    cte
WHERE
    rn BETWEEN (total_employees / 2::DECIMAL)
        AND (total_employees / 2::DECIMAL) + 1
ORDER BY
    company, salary, id
