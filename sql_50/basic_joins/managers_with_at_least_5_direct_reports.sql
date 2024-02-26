-- Write a solution to find managers with at least five direct reports.

WITH
    manager_direct_report_count
        AS
        (
            SELECT
                managerid
              , COUNT(*) AS cnt_employees
            FROM employee
            GROUP BY
                1
            HAVING
                managerid IS NOT NULL
        )
SELECT
    e.name
FROM manager_direct_report_count AS mdrc
     INNER JOIN employee AS e
        ON mdrc.managerid = e.id
WHERE
    cnt_employees >= 5;