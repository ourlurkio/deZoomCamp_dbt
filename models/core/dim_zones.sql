{{ config(materialized='table') }}


select 
    Locationid, 
    Borough, 
    Zone, 
    replace(service_zone,"Boro","Green") as service_zone
    
from {{ ref('taxi_zone_lookup') }}