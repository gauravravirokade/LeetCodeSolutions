-- Write a solution to calculate the number of bank accounts for each salary category. The salary categories are:
-- "Low Salary": All the salaries strictly less than $20000.
-- "Average Salary": All the salaries in the inclusive range [$20000, $50000].
-- "High Salary": All the salaries strictly greater than $50000.

SELECT
    'Low Salary' AS category,
    SUM(income < 20000) AS accounts_count
FROM
    Accounts

UNION

    SELECT
        'Average Salary' AS category,
        SUM(income BETWEEN 20000 AND 50000 ) AS accounts_count
    FROM
        Accounts

UNION

    SELECT
        'High Salary' AS category,
        SUM(income > 50000) AS accounts_count
    FROM
        Accounts;