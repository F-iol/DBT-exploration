with dedup_cte as (

select
    *,
    row_number() over (partition by id order by updated_at desc) as dedup_id
from 
    {{source('tables', 'items')}}
)
select 
    id,name,category,updated_at
from
     dedup_cte 
where
    dedup_id = 1