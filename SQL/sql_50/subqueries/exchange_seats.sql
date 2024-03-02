-- Write a solution to swap the seat id of every two consecutive students.
-- If the number of students is odd, the id of the last student is not swapped.

SELECT
    CASE
        WHEN id = (
                      SELECT
                          MAX(id)
                      FROM seat
                  ) AND id % 2 = 1
            THEN id -- if the number of students is odd, the id of the last student is not swapped
        WHEN id % 2 = 1
            THEN id + 1 --if id is odd, swap it with the next student
        ELSE
            id - 1 -- if id is even, swap it with the previous student
    END AS id
  , student
FROM seat
ORDER BY
    1;