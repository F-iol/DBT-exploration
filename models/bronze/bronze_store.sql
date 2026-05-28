select
    *
from
    {{ source('default', 'dim_store') }}