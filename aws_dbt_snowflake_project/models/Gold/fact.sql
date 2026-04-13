{% set congigs = [
    {
        "table" : "AIRBNB.GOLD.obt",
        "columns" : "GOLD_obt.BOOKING_ID,GOLD_obt.LISTING_ID,GOLD_obt.HOST_ID,GOLD_obt.TOTAL_AMOUNT,GOLD_obt.CLEANING_FEE,GOLD_obt.SERVICE_FEE,GOLD_obt.ACCOMMODATES,GOLD_obt.BEDROOMS,GOLD_obt.BATHROOMS,GOLD_obt.PRICE_PER_NIGHT,GOLD_obt.RESPONSE_RATE",
        "alias" : "GOLD_obt"
    },
    {
        "table" : "AIRBNB.GOLD.dim_listings",
        "columns": "",
        "alias" : "GOLD_listings",
        "join_condition" : "GOLD_obt.listing_id = GOLD_listings.listing_id"
    },
    {
        "table" : "AIRBNB.GOLD.dim_hosts",
        "columns" : "",
        "alias" : "dim_hosts",
        "join_condition" : "GOLD_obt.host_id = dim_hosts.host_id"
    }
] %}
SELECT 
        {{ congigs[0]['columns'] }}
from
    {% for config in congigs %}
    {% if loop.first %}
      {{ config['table'] }} as {{config['alias'] }}
    {% else %}
      left join {{config['table'] }} as {{config['alias'] }}
      on {{config['join_condition']}}
      {% endif %}
      {% endfor %}