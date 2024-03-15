-- Write a solution to report the distinct titles of the kid-friendly movies streamed in June 2020.
-- Return the result table in any order.

SELECT DISTINCT
    title
FROM tvprogram AS tp
     LEFT JOIN content AS c
        ON tp.content_id = c.content_id
WHERE
      MONTH(program_date) = 6
  AND YEAR(program_date) = 2020
  AND c.kids_content = 'Y'
  AND c.content_type = "Movies";
