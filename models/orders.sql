with orders as (

    select * from {{ ref('stg_orders') }}

),

payments as (

    select * from {{ ref('stg_payments') }}

),

final as (

    select 
    orders.order_id,
    orders.order_date,
    orders.customer_id,
    payments.amount

from orders


left join payments using (order_id)

)

select 

order_id,
order_date,
customer_id,
amount

from final