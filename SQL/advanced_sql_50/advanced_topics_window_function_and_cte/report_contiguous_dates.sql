-- Write a solution to report the period_state for each continuous interval of days in the period from 2019-01-01 to 2019-12-31.
-- period_state is 'failed' if tasks in this interval failed or 'succeeded' if tasks in this interval succeeded. Interval of days are retrieved as start_date and end_date.
-- Return the result table ordered by start_date.


WITH
    calendar_date
        AS ( -- generate a date range from 2019-01-01 to 2019-12-31
               SELECT GENERATE_SERIES('2019-01-01'::date, '2019-12-31'::date, '1 day'::interval)::date AS date_date
           )
  , calendar_days_status
        AS ( -- join the date range with the failed and succeeded tables to get the status of each day
               SELECT
                   date_date
                 , CASE
                       WHEN
                           f.fail_date IS NOT NULL
                           THEN 'failed'
                       WHEN s.success_date IS NOT NULL
                           THEN 'succeeded'
                   END AS task_status
               FROM calendar_date AS cd
                    LEFT JOIN failed AS f
                       ON cd.date_date = f.fail_date
                    LEFT JOIN succeeded AS s
                       ON cd.date_date = s.success_date
               WHERE -- filter out the days with no task status
                     f.fail_date IS NOT NULL
                 OR  s.success_date IS NOT NULL
           )
  , current_previous_task
        AS ( -- get the previous task status for each day
               SELECT
                   date_date
                 , task_status
                 , LAG(task_status) OVER (ORDER BY date_date) AS prev_task_status
               FROM calendar_days_status
           )
  , check_status
        AS ( -- check if the task status is different from the previous day
               SELECT
                   date_date
                 , task_status
                 , CASE
                       WHEN task_status = prev_task_status THEN 0
                       ELSE 1
                   END AS is_status_different
               FROM current_previous_task
           )
  , status_groups
        AS ( -- create groups of continuous days with the same task status
               SELECT *
                    , SUM(is_status_different) OVER (ORDER BY date_date) AS group_id
               FROM check_status
           )
  , create_groups
        AS ( -- get the period_state, start_date and end_date for each group
               SELECT
                   group_id
                 , MIN(task_status) AS period_state
                 , MIN(date_date)   AS start_date
                 , MAX(date_date)   AS end_date
               FROM status_groups
               GROUP BY
                   group_id
           )
  , final_result
        AS ( -- final select
               SELECT
                   period_state
                 , start_date
                 , end_date
               FROM create_groups
               ORDER BY
                   start_date
           )
SELECT *
FROM final_result;
