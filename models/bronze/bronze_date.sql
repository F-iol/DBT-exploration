select
    *
from
    {{ source('default', 'dim_date') }}