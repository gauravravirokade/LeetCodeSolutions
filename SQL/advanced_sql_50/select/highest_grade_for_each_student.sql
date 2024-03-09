-- Write a solution to find the highest grade with its corresponding course for each student.
-- In case of a tie, you should find the course with the smallest course_id.

WITH
    cte
        AS (
               SELECT
                   student_id
                 , course_id
                 , grade
                 , row_number() AS over (partition BY student_id ORDER BY grade DESC,course_id) AS score_rank
               FROM enrollments
           )

SELECT
    student_id
  , course_id
  , grade
FROM cte
WHERE
    score_rank = 1
ORDER BY
    student_id