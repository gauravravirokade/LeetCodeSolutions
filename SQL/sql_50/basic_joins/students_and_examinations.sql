WITH
    student_subject_combo
        AS (
               SELECT *
               FROM students
                    CROSS JOIN subjects
           )
  , exam_count
        AS (
               SELECT
                   e.student_id
                 , e.subject_name
                 , COUNT(*) AS attended_exams
               FROM examinations AS e
           )
SELECT
    ssc.student_id
  , ssc.student_name
  , ssc.subject_name
  , IFNULL(attended_exams, 0) AS attended_exams
FROM student_subject_combo AS ssc
     LEFT JOIN exam_count AS ec
        ON
    ssc.student_id = ec.student_id
        AND ssc.subject_name = ec.subject_name
ORDER BY
    student_id
  , subject_name;