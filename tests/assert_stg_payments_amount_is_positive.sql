with 
-- we must make a reference, for dbt to know which model this test must be assigned to
payments as (
    select * from {{ ref ('stg_payments') }}
)

-- dbt detects records that VIOLATE the assertion we are making about the data; if none are found, test is passed
select  
    order_id,
    sum(amount) as total_amount
from payments
group by 1
having total_amount < 0