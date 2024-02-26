-- Write a solution to report the name and bonus amount of each employee with a bonus less than 1000.

SELECT
    e.name
  , COALESCE(b.bonus, NULL) AS bonus
FROM employee AS e
     LEFT JOIN bonus AS b
        ON e.empid = b.empid
WHERE
     bonus < 1000
  OR bonus IS NULL;