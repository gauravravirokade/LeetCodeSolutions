-- Write a solution to get the names of products that have at least 100 units ordered in February 2020 and their amount.

select
    p.product_name
    , sum(o.unit) as unit
from products as p
join orders as o
on p.product_id = o.product_id
where
     month(order_date) = 2
     and year(order_date) =2020
group by
    p.product_id
having
    unit >=100