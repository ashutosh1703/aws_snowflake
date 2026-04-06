{% set flag = 1 %}

select * from {{ ref('Bronze_bookings') }} 
{% if flag == 1 %}
    where Booking_amount >500
{% else %}
    where Booking_amount <500
{% endif %}