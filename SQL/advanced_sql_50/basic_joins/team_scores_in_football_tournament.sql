-- Write a solution that selects the team_id, team_name and num_points of each team in the tournament after all described matches.
-- Return the result table ordered by num_points in decreasing order.
-- In case of a tie, order the records by team_id in increasing order.

WITH
    results
        AS ( -- Calculate points for each match
               SELECT *
                    , CASE
                          WHEN host_goals > guest_goals
                              THEN 3
                          WHEN host_goals < guest_goals
                              THEN 0
                          WHEN host_goals = guest_goals
                              THEN 1
                      END AS host_team_points
                    , CASE
                          WHEN host_goals < guest_goals
                              THEN 3
                          WHEN host_goals > guest_goals
                              THEN 0
                          WHEN host_goals = guest_goals
                              THEN 1
                      END AS guest_team_points
               FROM matches
           )
  , team_points
        AS ( -- Calculate points for each team
               SELECT
                   match_id
                 , host_team        AS team_id
                 , host_team_points AS points
               FROM results
               UNION ALL
               SELECT
                   match_id
                 , guest_team        AS team_id
                 , guest_team_points AS points
               FROM results
           )
-- Calculate total points for each team
SELECT
    t.team_id
  , t.team_name
  , ifnull(SUM(points), 0) AS num_points
FROM teams AS t
     LEFT JOIN team_points AS tp
        ON tp.team_id = t.team_id
GROUP BY
    1
  , 2
ORDER BY
    3 DESC
  , 1 ASC
