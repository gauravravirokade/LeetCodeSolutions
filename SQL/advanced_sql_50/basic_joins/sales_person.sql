-- Write a solution to find the names of all the salespersons who did not have any orders related to the company with the name "RED".

WITH
    red_companies
        AS ( -- Find the salespersons who have orders related to the company with the name "RED"
               SELECT
                   s.name AS salesperson_name
               FROM salesperson s
                    LEFT JOIN orders o
                       ON s.sales_id = o.sales_id
                    LEFT JOIN company c
                       ON o.com_id = c.com_id
               WHERE
                   c.name = 'Red'
           )
SELECT
    s.name
FROM salesperson s
     LEFT JOIN red_companies rc
        ON s.name = rc.salesperson_name
WHERE
    rc.salesperson_name IS NULL; -- Find the salespersons who did not have any orders related to the company with the name "RED"