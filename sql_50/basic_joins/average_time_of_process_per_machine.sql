-- The resulting table should have the machine_id along with the average time as processing_time, which should be rounded to 3 decimal places.

WITH
    process_start
        AS (
               SELECT
                   machine_id
                 , process_id
                 , timestamp AS start_time
               FROM activity
               WHERE
                   activity_type = 'start'
           )
  , process_end
        AS (
               SELECT
                   machine_id
                 , process_id
                 , timestamp AS end_time
               FROM activity
               WHERE
                   activity_type = 'end'
           )
  , process_duration
        AS (
               SELECT
                   ps.machine_id
                 , ps.process_id
                 , ps.start_time
                 , pe.end_time
                 , pe.end_time - ps.start_time AS process_run_time
               FROM process_start AS ps
                    LEFT JOIN process_end AS pe
                       ON ps.machine_id = pe.machine_id
                   AND ps.process_id = pe.process_id
           )
SELECT
    machine_id
  , ROUND(AVG(process_run_time), 3) AS processing_time
FROM process_duration
GROUP BY
    machine_id


-- select * from process_start;
