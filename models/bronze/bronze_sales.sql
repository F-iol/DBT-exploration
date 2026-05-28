{{
  config(
    materialized = 'view',
    )
}}

SELECT
    *
FROM
    {{source('default', 'fact_sales')}}
    
 