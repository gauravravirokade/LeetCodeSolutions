-- Write a solution to report the IDs of the missing subtasks for each task_id.


WITH
    subtask_sequence
        AS ( -- Generate a sequence of subtask IDs from 1 to 100
               SELECT *
               FROM GENERATE_SERIES(1, 100, 1) AS subtask_id
           )
  , task_cross_subtask
        AS ( -- Cross join the tasks with the subtask sequence
               SELECT *
               FROM tasks
                    CROSS JOIN subtask_sequence
           )
  , all_subtasks
        AS ( -- limit the subtask sequence to the actual subtask count
               SELECT
                   task_id
                 , subtask_id
               FROM task_cross_subtask
               WHERE
                   subtask_id <= subtasks_count
           )
  , missing_subtasks
        AS ( -- Find the missing subtasks from the executed subtasks
               SELECT
                   asb.task_id
                 , asb.subtask_id
               FROM all_subtasks as asb
                    LEFT JOIN executed as e
                       ON asb.task_id = e.task_id
                   AND asb.subtask_id = e.subtask_id
               WHERE
                   e.subtask_id IS NULL -- missing subtask
           )
SELECT *
FROM missing_subtasks
