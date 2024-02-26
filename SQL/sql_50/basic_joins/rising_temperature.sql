-- Write a solution to find all dates' Id with higher temperatures compared to its previous dates (yesterday).

WITH
    temperatures
        AS (
               SELECT
                   id
                 , recorddate
                 , temperature
                 , date_add(recorddate, INTERVAL -1 DAY ) AS yesterday
               FROM weather
           )
SELECT
    t.id
FROM temperatures AS t
     LEFT JOIN temperatures AS t1
        ON t.yesterday = t1.recorddate
WHERE
    t.temperature > t1.temperature;


-- Below solution fails for cases when we have missing records for a date between two dates.
--
-- WITH
--     temperatures
--         AS (
--                SELECT
--                    id
--                  , recorddate
--                  , temperature      AS todays_temp
--                  , lag(temperature) AS over (ORDER BY recordDate) AS yesterdays_temp
--                FROM weather
--            )
--
-- SELECT
--     id
-- FROM temperatures
-- WHERE
--     todays_temp > yesterdays_temp;

