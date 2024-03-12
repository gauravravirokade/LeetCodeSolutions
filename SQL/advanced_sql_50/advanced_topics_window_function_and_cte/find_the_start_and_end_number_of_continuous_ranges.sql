-- Write a solution to find the start and end number of continuous ranges in the table Logs.
--
-- Return the result table ordered by start_id.

WITH
    rank_logs
        AS ( -- create a row counter for the logs
               SELECT
                   log_id
                 , ROW_NUMBER() OVER ( ORDER BY log_id) AS log_id_rank
               FROM logs
           )
  , group_ranks
        AS ( -- create a group for each continuous range
               SELECT
                   log_id
                 , log_id_rank - log_id AS log_group
               FROM rank_logs
           )
  , group_min_max
        AS ( -- find the start and end of each group
               SELECT
                   MIN(log_id) AS start_id
                 , MAX(log_id) AS end_id
               FROM group_ranks
               GROUP BY
                   log_group
           )
SELECT
    start_id
  , end_id
FROM group_min_max
ORDER BY
    start_id;

