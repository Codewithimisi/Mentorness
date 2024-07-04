create database mentorness;
use mentorness;

-- 1)What is the total number of reservations in the dataset? 
select count(booking_ID) as no_of_reservations
from hotelreservationdataset;

-- 2)Which meal plan is the most popular among guests? 
select type_of_meal_plan, 
       count(*) as meal_plan_count
from hotelreservationdataset
group by type_of_meal_plan
order by meal_plan_count desc
limit 1;

-- 3)What is the average price per room for reservations involving children?
select avg(avg_price_per_room) as avg_price_of_room_involving_children
from hotelreservationdataset
where no_of_children != 0;

-- 4)How many reservations were made for the year 2018?
select count(*) as total_reservations_in_2018
from hotelreservationdataset
where arrival_date like '%2018%';

-- 5)What is the most commonly booked room type?
select room_type_reserved, 
       count(room_type_reserved) as common_roomtype
from hotelreservationdataset
group by room_type_reserved
order by common_roomtype desc
limit 1;

-- 6)How many reservations fall on a weekend? 
select count(*) as total_weekend_reservations
from hotelreservationdataset
where no_of_weekend_nights > 0;

-- 7)What is the highest and lowest lead time for reservations? 
select max(lead_time) as highest_leadtime, 
       min(lead_time) as lowest_leadtime
from hotelreservationdataset;

-- 8)What is the most common market segment type for reservations? 
select market_segment_type, 
       count(market_segment_type) as segment_type_count
from hotelreservationdataset
group by market_segment_type
order by segment_type_count desc
limit 1;

-- 9)How many reservations have a booking status of Confirmed? 
select count(*) as no_of_confirmed_bookings
from hotelreservationdataset
where booking_status= 'Not_Canceled';

-- 10)What is the total number of adults and children across all reservations?
select sum(no_of_adults) as total_adults, 
       sum(no_of_children) as total_children
from hotelreservationdataset;

-- 11)What is the average number of weekend nights for reservations involving children?
select avg(no_of_weekend_nights) as avg_weekend_nights
from hotelreservationdataset
where no_of_children > 0;

-- 12)How many reservations were made in each month of the year?
select monthname(str_to_date(arrival_date, '%m/%d/%y')) as month ,
	   month(str_to_date(arrival_date, '%m/%d/%y')) AS month_number,
	   count(*) as total_reservations
from hotelreservationdataset
group by month, month_number
order by month_number;

-- 13)What is the average number of nights (both weekend and weekday) spent by guests for each room type?
select room_type_reserved,
       avg(no_of_weekend_nights + no_of_week_nights) AS avg_total_nights
from hotelreservationdataset
group by room_type_reserved;

-- 14)For reservations involving children, what is the most common room type, and what is the average price for that room type?
select room_type_reserved, 
	   avg(avg_price_per_room) as avg_price,
       count(room_type_reserved) as most_common_roomtype
from hotelreservationdataset
where no_of_children != 0
group by room_type_reserved
order by most_common_roomtype desc
limit 1;

-- 15)Find the market segment type that generates the highest average price per room.
select market_segment_type, 
       avg(avg_price_per_room) as avg_price
from hotelreservationdataset
group by market_segment_type
order by avg_price desc
limit 1;
