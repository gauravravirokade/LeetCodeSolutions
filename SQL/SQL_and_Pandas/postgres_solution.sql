-- Write your PostgreSQL query statement below

WITH
    filter_trips
        AS (SELECT
                *
            FROM
                trips
            WHERE
                request_at BETWEEN '2013-10-01' AND '2013-10-03')


  , get_user_status
        AS (SELECT
                t.*
              , client.banned AS client_banned_status
              , driver.banned AS driver_banned_status
            FROM
                filter_trips AS ft
                    LEFT JOIN users AS client
                              ON t.client_id = client.users_id
                    LEFT JOIN users AS driver
                              ON t.driver_id = driver.users_id)

  , exclude_banned_users
        AS (SELECT
                *
            FROM
                get_user_status
            WHERE
                  client_banned_status = 'No'
              AND driver_banned_status = 'No')

  , identify_cancelled_rides
        AS (SELECT
                *
              , CASE
                    WHEN
                        status IN ('cancelled_by_driver', 'cancelled_by_client')
                        THEN 1
                    ELSE 0
                    END AS is_ride_cancelled
            FROM
                exclude_banned_users)

  , get_daily_rides
        AS (
-- select status,is_ride_cancelled from identify_cancelled_rides;
        SELECT
            request_at                                               AS day
          , SUM(is_ride_cancelled)                                   AS cnt_cancelled
          , COUNT(*)                                                 AS cnt_total
          , ROUND(((SUM(is_ride_cancelled)::DECIMAL / COUNT(*))), 2) AS cancellation_rate
        FROM
            identify_cancelled_rides
        GROUP BY
            1)

SELECT
    day               AS "Day"
  , cancellation_rate AS "Cancellation Rate"
FROM
    get_daily_rides