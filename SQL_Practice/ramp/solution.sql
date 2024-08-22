/* Using this dataset, show the SQL query to find the rolling 3 day average transaction amount for each day in January 2021. */

with get_date
    as (
    select transaction_time
             , TO_CHAR(transaction_time, 'DD/MM/YYYY') as transaction_date
             , transaction_amount
        from transactions
        )

   , daily_transactions
    as (
    select transaction_date
             , sum(transaction_amount) as total_amount
        from get_date
        group by transaction_date
        )

   , calculate_rolling_average
    as (SELECT transaction_date,
               total_amount,
               ROUND(AVG(total_amount) OVER (
                   ORDER BY transaction_date
                   ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
                   )::numeric, 2) AS rolling_3_day_avg
        FROM daily_transactions
        order by transaction_date
        )

select *
from calculate_rolling_average
where transaction_date = '31/01/2021';
