# Write a solution to find all the classes that have at least five students.

SELECT
    class
FROM courses
GROUP BY
    class
HAVING
    COUNT(class) >= 5;