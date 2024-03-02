-- Write a solution to find the employees who are high earners in each of the departments.

WITH
    department_salaries
        AS ( -- Rank the employees in each department by their salary in descending order.
               SELECT
                   id
                 , name
                 , salary
                 , departmentid
                 , DENSE_RANK() OVER (PARTITION BY departmentid ORDER BY salary DESC) AS salary_rank -- using dense rank to handle the case of multiple employees with the same salary
               FROM employee
-- order by departmentId,salary_rank
           )

SELECT
    d.name AS department
  , ds.salary
  , ds.name AS employee
FROM department_salaries AS ds
     LEFT JOIN department AS d
        ON ds.departmentid = d.id
WHERE
    ds.salary_rank <= 3 -- Select the employees with the top 3 salaries in each department.