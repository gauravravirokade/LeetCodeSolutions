# Write a solution to report the movies with an odd-numbered ID and a description that is not "boring".
# Return the result table ordered by rating in descending order.

SELECT *
FROM cinema
WHERE
      id % 2 = 1
  AND LOWER(description) NOT LIKE '%boring%'
ORDER BY
    4 DESC;