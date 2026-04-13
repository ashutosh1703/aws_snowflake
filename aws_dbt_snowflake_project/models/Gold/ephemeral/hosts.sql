{{
  config(
    materialized = 'ephemeral',
    )
}}

with hosts as 
(
    SELECT
        HOST_ID,
        HOST_NAME,
        HOST_SINCE,
        IS_SUPERHOST,
        RESPONSE_RATE_QUALITY,
        HOST_CREATED_AT

    from
        {{ ref('obt') }}
)
SELECT * FROM hosts