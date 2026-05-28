select
    *
from
    {{ source('default', 'dim_product') }}