with orders as (

    select * from {{ ref('stg_orders') }}

),

payment as (

    select * from {{ ref('stg_payment') }}

),

final as (

    select 
    orders.order_id,
    orders.order_date,
    orders.customer_id,
    payment.amount

from orders


left join payment using (order_id)

)

select 

order_id,
order_date,
customer_id,
amount

from final