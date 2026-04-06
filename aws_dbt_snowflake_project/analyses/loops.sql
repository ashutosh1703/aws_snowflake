{% set var = ['Booking_id','BOOKING_DATE','booking_amount'] %}

select
{% for item in var %}
    {{ item }}
        {% if not loop.last %}, {% endif %}  
{% endfor %}
from {{ ref('Bronze_bookings') }}