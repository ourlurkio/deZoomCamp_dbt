{{ config(materialized="table")}}

SELECT * FROM {{ ref('stg_fhv_tripdata') }}

WHERE pickup_datetime BETWEEN "2019-01-01 00:00:00" AND "2020-12-31 23:59:59"