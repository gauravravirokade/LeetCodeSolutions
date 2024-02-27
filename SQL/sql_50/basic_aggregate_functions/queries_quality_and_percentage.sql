-- Write a solution to find each query_name, the quality and poor_query_percentage.
-- Both quality and poor_query_percentage should be rounded to 2 decimal places.

SELECT
    query_name
  , round(AVG(rating / position), 2)                       AS quality
  , round((SUM(if(rating < 3, 1, 0)) / COUNT(*)) * 100, 2) AS poor_query_percentage

FROM queries
GROUP BY
    1
HAVING
    query_name IS NOT NULL;