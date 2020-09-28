select
    orderid as order_id,
    status,
    amount/100 as amount
from raw.stripe.payment

where status = 'success'