-- Write a solution to report the fraction of players that logged in again on the day after the day they first logged in,rounded to 2 decimal places.
-- In other words, you need to count the number of players that logged in for at least two consecutive days starting from their first login date, then divide that number by the total number of players.

WITH
    first_and_next_logins
        AS ( -- calculate the first and next login date for each player
               SELECT
                   player_id
                 , event_date
                 , MIN(event_date) OVER (PARTITION BY player_id)                          AS first_login_date
                 , LEAD(event_date) OVER (PARTITION BY player_id ORDER BY event_date ASC) AS next_login_date
               FROM activity
           )
  , flag_players
        AS ( -- flag the players who logged in on the next day after their first login date
               SELECT
                   player_id
                 , IF(DATEDIFF(next_login_date, first_login_date) = 1, 1, 0) AS has_player_logged_next_day
               FROM first_and_next_logins
           )
SELECT
    ROUND(SUM(has_player_logged_next_day) / COUNT(DISTINCT player_id), 2) AS fraction
FROM flag_players;