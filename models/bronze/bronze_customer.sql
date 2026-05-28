select
    *
from
    {{ source('default', 'dim_customer') }}