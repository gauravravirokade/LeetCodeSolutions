CREATE OR REPLACE FUNCTION NthHighestSalary(N INT)
    RETURNS TABLE
            (
                Salary INT
            )
AS
$$
BEGIN
    RETURN QUERY (select e.salary
                  from ( -- using subquery as CTE dont work within a Function
                           select e1.salary
                                , dense_rank() over (order by e1.salary desc) as salary_rank
                           from employee as e1) as e
                  where e.salary_rank = N
                  limit 1 -- to ensure function returns only 1 value

    );
END;
$$ LANGUAGE plpgsql;