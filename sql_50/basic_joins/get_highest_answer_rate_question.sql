# Write a solution to report the question that has the highest answer rate.
# If multiple questions have the same maximum answer rate, report the question with the smallest question_id.

WITH
    calculate_answer_rate
        AS (
               SELECT
                   question_id
                 , SUM(IF(answer_id IS NOT NULL, 1, 0)) / SUM(IF(action = 'show', 1, 0)) AS answer_rate
               FROM surveylog
               GROUP BY
                   1
           )
  , rank_answers
        AS (
               SELECT *
                    , ROW_NUMBER() OVER ( ORDER BY answer_rate DESC, question_id ASC) AS answer_rank
               FROM calculate_answer_rate
           )
SELECT
    question_id AS survey_log
FROM rank_answers
WHERE
    answer_rank = 1;