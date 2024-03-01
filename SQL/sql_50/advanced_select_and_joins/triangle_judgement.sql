-- Report for every three line segments whether they can form a triangle.

SELECT
    x
  , y
  , z
  , CASE
        WHEN (x + y) > z AND (y + z) > x AND (x + z) > y
            THEN 'Yes'
        ELSE 'No'
    END AS triangle
FROM triangle;