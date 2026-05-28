{% set init_load =1%}
{% set last_load = 3%}

{% set col_list = ['date_sk','sales_id','gross_amount']%}


select
    {% for i in col_list%}

    {{i}}{% if not loop.last %}, {% endif %}

    {% endfor %}
from
     {{ ref('bronze_sales')}}

{% if init_load == 1 %}
where
    date_sk > {{last_load}}

{% endif %}
