-- Write a solution to:
-- Find the name of the user who has rated the greatest number of movies. In case of a tie, return the lexicographically smaller user name.
-- Find the movie name with the highest average rating in February 2020. In case of a tie, return the lexicographically smaller movie name.

WITH
    highest_user
        AS (
               SELECT
                   mr.user_id
                 , u.name
                 , COUNT(movie_id) AS cnt_movies
               FROM movierating AS mr
                    LEFT JOIN users AS u
                       ON mr.user_id = u.user_id
               GROUP BY
                   1
               ORDER BY
                   3 DESC
                 , 2 ASC
               LIMIT 1
           )
  , feb_movies
        AS (
               SELECT *
               FROM movierating
               WHERE
                   created_at LIKE '2020-02%'
           )
  , movie_highest
        AS (
               SELECT
                   mr.movie_id
                 , m.title
                 , AVG(
                           rating)
               FROM feb_movies AS mr
                    LEFT JOIN movies AS m
                       ON mr.movie_id = m.movie_id
               GROUP BY
                   1
                 , 2
               ORDER BY
                   3 DESC
                 , 2 ASC
               LIMIT 1
           )
SELECT
    name AS results
FROM highest_user
UNION ALL
SELECT
    title AS results
FROM movie_highest