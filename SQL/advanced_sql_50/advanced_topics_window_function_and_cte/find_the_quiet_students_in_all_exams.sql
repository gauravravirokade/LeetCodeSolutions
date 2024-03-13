-- A quiet student is the one who took at least one exam and did not score the highest or the lowest score.

-- Write a solution to report the students (student_id, student_name) being quiet in all exams.
-- Do not return the student who has never taken any exam.

-- Return the result table ordered by student_id.

WITH
    exam_rank
        AS ( -- Get the rank of each student in each exam based on the score
               SELECT
                   exam_id
                 , student_id
                 , DENSE_RANK() OVER (PARTITION BY exam_id ORDER BY score DESC) AS student_rank
               FROM exam
           )
  , first_last_in_exam
        AS ( -- Get the first and last rank in each exam
               SELECT
                   exam_id
                 , MIN(student_rank) AS first_rank
                 , MAX(student_rank) AS last_rank
               FROM exam_rank
               GROUP BY
                   exam_id
           )
  , check_first_last_students
        AS ( -- Check if the student is the first or last rank in the exam
               SELECT
                   er.exam_id
                 , er.student_id
                 , CASE
                       WHEN student_rank = first_rank OR student_rank = last_rank
                           THEN 1
                       ELSE 0
                   END AS is_student_first_last
               FROM exam_rank AS er
                    LEFT JOIN first_last_in_exam AS flim
                       ON er.exam_id = flim.exam_id
           )
  , agg_student_ranks
        AS ( -- check if the student is the first or last rank in any exam
               SELECT
                   student_id
                 , SUM(is_student_first_last) AS cnt_first_last_ranks
               FROM check_first_last_students
               GROUP BY
                   1
           )
,quite_students
    as ( -- Get the students who are quiet in all exams
           SELECT
               asr.student_id
             , s.student_name
           FROM agg_student_ranks AS asr
                LEFT JOIN student AS s
                   ON asr.student_id = s.student_id
           WHERE
               cnt_first_last_ranks = 0
       )

SELECT
    *
FROM quite_students
ORDER BY
    student_id;
