select
    *
from
    {{ source('default', 'fact_returns') }}