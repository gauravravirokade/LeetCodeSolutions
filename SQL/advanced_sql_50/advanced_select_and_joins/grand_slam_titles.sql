-- Write a solution to report the number of grand slam tournaments won by each player.
-- Do not include the players who did not win any tournament.

WITH
    cte AS
        (
            SELECT
                wimbledon AS player_id
            FROM championships
            UNION ALL
            SELECT
                fr_open AS player_id
            FROM championships
            UNION ALL
            SELECT
                us_open AS player_id
            FROM championships
            UNION ALL
            SELECT
                au_open AS player_id
            FROM championships
        )

SELECT
    c.player_id
  , p.player_name
  , COUNT(*) AS grand_slams_count
FROM cte AS c
     LEFT JOIN players AS p
        ON c.player_id = p.player_id
GROUP BY
    c.player_id
  , p.player_name;