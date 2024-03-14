-- Each node in the tree can be one of three types:

-- "Leaf": if the node is a leaf node.
-- "Root": if the node is the root of the tree.
-- "Inner": If the node is neither a leaf node nor a root node.
-- Write a solution to report the type of each node in the tree.

WITH
    cte AS
        ( -- get the parent and leaf nodes
            SELECT
                t.id
              , t.p_id
              , t2.p_id AS l_id
            FROM tree AS t
                 LEFT JOIN tree AS t2
                    ON t.id = t2.p_id
        )
SELECT DISTINCT
    id
  , CASE
        WHEN p_id IS NULL THEN 'Root'
        WHEN p_id IS NOT NULL AND l_id IS NOT NULL THEN 'Inner'
        WHEN p_id IS NOT NULL AND l_id IS NULL THEN 'Leaf'
    END AS type
FROM cte;