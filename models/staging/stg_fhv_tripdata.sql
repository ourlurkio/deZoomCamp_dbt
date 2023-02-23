{{ config(materialized='view') }}

select 

-- identifiers
    {{ dbt_utils.surrogate_key(["dispatching_base_num", "pickup_datetime"]) }} as tripid,
    cast(dispatching_base_num as string) as dispatching_base_num,
    cast(PUlocationID as integer) as  PUlocationID,
    cast(DOlocationID as integer) as DOlocationID,
    
    -- timestamps
    cast(pickup_datetime as timestamp) as pickup_datetime,
    cast(dropOff_datetime as timestamp) as dropoff_datetime,
    
    -- trip info
    {{ coalesce_nulls("SR_Flag", "integer")}}

from {{ source("staging", "fhv_data") }}
where dispatching_base_num is not null
-- dbt build --m <model.sql> --var 'is_test_run: false'
{% if var('is_test_run', default=true) %}

    limit 100

{% endif %}