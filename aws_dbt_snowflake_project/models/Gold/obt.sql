{% set congigs = [
    {
        "table" : "AIRBNB.Silver.Silver_bookings",
        "columns" : "Silver_bookings.*",
        "alias" : "Silver_bookings"
    },
    {
        "table" : "AIRBNB.Silver.Silver_listings",
        "columns": "Silver_listings.HOST_ID,Silver_listings.PROPERTY_TYPE,Silver_listings.ROOM_TYPE,Silver_listings.CITY,Silver_listings.COUNTRY,Silver_listings.ACCOMMODATES,Silver_listings.BEDROOMS,Silver_listings.BATHROOMS,Silver_listings.PRICE_PER_NIGHT,Silver_listings.PRICE_PER_NIGHT_TAG,Silver_listings.CREATED_AT AS LISTING_CREATED_AT",
        "alias" : "Silver_listings",
        "join_condition" : "Silver_bookings.listing_id = Silver_listings.listing_id"
    },
    {
        "table" : "AIRBNB.Silver.Silver_hosts",
        "columns" : "Silver_hosts.HOST_NAME,Silver_hosts.HOST_SINCE,Silver_hosts.IS_SUPERHOST,Silver_hosts.RESPONSE_RATE,Silver_hosts.RESPONSE_RATE_QUALITY,Silver_hosts.CREATED_AT as HOST_CREATED_AT",
        "alias" : "Silver_hosts",
        "join_condition" : "Silver_listings.host_id = Silver_hosts.host_id"
    }
] %}
SELECT 
    {% for config in congigs %}
        {{ config['columns'] }}{% if not loop.last %},{% endif %}
    {% endfor %}
from
    {% for config in congigs %}
    {% if loop.first %}
      {{ config['table'] }} as {{config['alias'] }}
    {% else %}
      left join {{config['table'] }} as {{config['alias'] }}
      on {{config['join_condition']}}
      {% endif %}
      {% endfor %}