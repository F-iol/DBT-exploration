with refunds as (
    select 
        sales_id,
        store_sk,
        product_sk,
        return_reason,
        refund_amount
    from
        {{ref ('bronze_returns')}}
),
products as (
    select 
        product_sk,
        category
    from
        {{ref ('bronze_product')}}
),
sales as (
    select 
        sales_id,
        product_sk,
        customer_sk
    from
        {{ref ('bronze_sales')}}
),
customer as (
    select
        customer_sk,
        gender
    from 
        {{ref ('bronze_customer')}}    
),

joined_query as (
    select 
        r.sales_id,
        r.refund_amount,
        r.return_reason,
        p.category,
        c.gender
    from
        refunds r
    join
        products p on r.product_sk = p.product_sk
    join
        sales s on r.sales_id = s.sales_id
    join
        customer c on s.customer_sk = c.customer_sk
)
select
    category,
    return_reason,
    sum(refund_amount) as total_refund_amount
from
    joined_query
GROUP BY ALL
order by 
    total_refund_amount desc