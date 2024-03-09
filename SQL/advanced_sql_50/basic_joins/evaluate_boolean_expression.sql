-- Evaluate the boolean expressions in Expressions table.

SELECT
    left_operand
  , operator
  , right_operand
  , CASE
        WHEN operator = '=' AND v.value = v1.value
            THEN 'true'
        WHEN operator = '<' AND v.value < v1.value
            THEN 'true'
        WHEN operator = '>' AND v.value > v1.value
            THEN 'true'
        ELSE 'false'
    END AS value
FROM expressions AS e
     LEFT JOIN variables AS v
        ON e.left_operand = v.name
     LEFT JOIN variables AS v1
        ON e.right_operand = v1.name