-- Find the id and the name of all students who are enrolled in departments that no longer exist.
-- Return the result table in any order.

SELECT
    s.id
  , s.name
FROM students AS s
     LEFT JOIN departments AS d
        ON s.department_id = d.id
WHERE
    d.id IS NULL