CREATE TABLE IF NOT EXISTS public.bookings
(
    booking_id character varying(20) COLLATE pg_catalog."default" NOT NULL,
    no_of_adults integer,
    no_of_children integer,
    no_of_weekend_nights integer,
    no_of_week_nights integer,
    type_of_meal_plan character varying(50) COLLATE pg_catalog."default",
    room_type_reserved character varying(50) COLLATE pg_catalog."default",
    lead_time integer,
    arrival_date date,
    market_segment_type character varying(50) COLLATE pg_catalog."default",
    avg_price_per_room numeric,
    booking_status character varying(20) COLLATE pg_catalog."default",
    CONSTRAINT bookings_pkey PRIMARY KEY (booking_id)
)



\copy bookings
(Booking_ID, no_of_adults, no_of_children, no_of_weekend_nights, no_of_week_nights, type_of_meal_plan, room_type_reserved, lead_time, arrival_date, market_segment_type, avg-price_per_room, booking_status)
FROM '/Users/skander/Documents/mentorness/Data Analyst Internship MIP-DA-10/ Task 2_ Hotel reservation analysis in SQL/Hotel Reservation Dataset.csv'
DELIMITER ' ,'
CSV

SELECT count(*) FROM public.bookings;

SELECT type_of_meal_plan, count(*) as COUNT_ROWS
from bookings
group by type_of_meal_plan
order by count_rows desc
limit 1;

SELECT avg(avg_price_per_room) from bookings where no_of_children <> 0;

SELECT count(*) from bookings where EXTRACT(YEAR FROM arrival_date) = 2020;

SELECT room_type_reserved, COUNT(*) AS count_type
FROM bookings
GROUP BY room_type_reserved
ORDER BY count_type DESC
LIMIT 1;

SELECT COUNT (*) AS count_wn
FROM bookings
where no_of_weekend_nights> 0

SELECT MAX (lead_time) AS highest_lead,MIN (lead_time) AS lowest_lead FROM bookings;

SELECT market_segment_type , count(*) as count_mst
FROM bookings
group by market_segment_type
order by count_mst desc
Limit 1;

SELECT count(*) as count
FROM bookings
where 'booking_status' ='Confirmed'

SELECT sum(no_of_adults) , sum (no_of_children) FROM bookings

SELECT avg(no_of_weekend_nights) FROM bookings where no_of_children > 0

SELECT
EXTRACT (month FROM arrival_date) AS month_number,
COUNT (*) AS reservations
FROM bookings
GROUP BY month_number
ORDER BY month_number;

SELEC room_type_reserved, AVG ( (no_of_weekend_nights + no_of_week_nights) ) AS avg_nights
FROM bookings
GROUP BY room_type_reserved;

SELECT room_type_reserved, count (*) as cnt,

avg(avg_price_per_room) as avg_price
FROM bookings
WHERE no_of_children >0
GROUP BY room_type_reserved
ORDER BY cnt DESC
LIMIT 1;

SELECT market_segment_type, AVG (avg_price_per_room) as avg_price
FROM bookings
GROUP BY market_segment_type
ORDER BY avg_price DESC
LIMIT 1;



