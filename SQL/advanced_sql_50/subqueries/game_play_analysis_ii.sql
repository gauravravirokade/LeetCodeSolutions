-- Write a solution to report the device that is first logged in for each player.

SELECT DISTINCT
    player_id
  , FIRST_VALUE(device_id) AS over (partition BY player_id ORDER BY event_date) AS device_id
FROM activity