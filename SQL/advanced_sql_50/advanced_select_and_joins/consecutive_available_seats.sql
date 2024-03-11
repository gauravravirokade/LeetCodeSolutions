-- Find all the consecutive available seats in the cinema.
-- Return the result table ordered by seat_id in ascending order.

WITH
    seats
        AS (
               SELECT
                   seat_id
                 , free                               AS is_current_seat_free
                 , LEAD(free) OVER (ORDER BY seat_id) AS is_next_seat_free
                 , LAG(free) OVER (ORDER BY seat_id)  AS is_prev_seat_free
               FROM cinema
           )
SELECT
    seat_id
FROM seats
WHERE
     (is_next_seat_free = 1 AND is_current_seat_free = 1)
  OR (is_prev_seat_free = 1 AND is_current_seat_free = 1)
ORDER BY
    seat_id;