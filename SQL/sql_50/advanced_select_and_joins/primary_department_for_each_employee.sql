-- Write a solution to report all the employees with their primary department.
-- For employees who belong to one department, report their only department.

SELECT
  employee_id,
  department_id
FROM
  Employee
Group By
  employee_id
Having count(employee_id)=1
UNION
SELECT
  employee_id,
  department_id
FROM
  Employee
WHERE primary_flag = 'Y'