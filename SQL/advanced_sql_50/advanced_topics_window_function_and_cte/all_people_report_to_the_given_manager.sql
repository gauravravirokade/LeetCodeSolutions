-- Write a solution to find employee_id of all employees that directly or indirectly report their work to the head of the company.
-- The indirect relation between managers will not exceed three managers as the company is small.

WITH
    cte
        AS (
               SELECT
                   e.employee_id
                 , e.manager_id  AS m -- direct manager
                 , e1.manager_id AS m1 -- manager of direct manager
                 , e2.manager_id AS m2 -- manager of manager of direct manager
               FROM employees AS e
                    LEFT JOIN employees AS e1
                       ON e.manager_id = e1.employee_id
                    LEFT JOIN employees AS e2
                       ON e1.manager_id = e2.employee_id
           )
SELECT
    employee_id
FROM cte
WHERE
      (m = 1 OR m1 = 1 OR m2 = 1)
  AND (employee_id != m);
;