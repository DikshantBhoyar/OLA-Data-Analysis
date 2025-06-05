use ola;
select * from bookings;

#1. Retrieve all successful bookings:
CREATE VIEW Successful_Bookings AS
select * from bookings where Booking_Status = "Success";

select * from Successful_Bookings;

#2. Find the average ride distance for each vehicle type:
Create View average_ride_distance_for_each_vehicle As
select Vehicle_Type , AVG(Ride_Distance)
AS average_dist from bookings
Group By Vehicle_Type;

select * FROM average_ride_distance_for_each_vehicle;

#3. Get the total number of cancelled rides by customers:
create view numbe_of_cancelled_rides_by_customers AS
select count(*) from bookings
where Booking_Status = "Canceled by Customer";

select * from numbe_of_cancelled_rides_by_customers;

#4. List the top 5 customers who booked the highest number of rides:
select * from bookings;
select Customer_ID, Count(Booking_ID) as total_rides
from bookings
Group by Customer_ID
order by total_rides desc limit 5;


#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
select * from bookings;
create view cancelled_by_drivers_P_C_issues AS
select count(Canceled_Rides_by_Driver) 
as cancled_by_driver
from bookings
where Canceled_Rides_by_Driver = "Personal & Car related issue";

select * from cancelled_by_drivers_P_C_issues;

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
select * from bookings;
create view max_min_driver_ratings AS
select max(Driver_Ratings) as max_ratings,
min(Driver_Ratings) as min_ratings
from bookings
where Vehicle_Type = "Prime Sedan";

select * from max_min_driver_ratings;

#7. Retrieve all rides where payment was made using UPI:
create view rides_UPI_payments AS
select * from bookings
where Payment_Method = "UPI";

select * from rides_UPI_payments;

#8. Find the average customer rating per vehicle type:
create view avg_customer_ratings AS
select Vehicle_Type, AVG(Customer_Rating) 
as customer_ratings
from bookings
group by Vehicle_Type
order by customer_ratings desc;

select * from avg_customer_ratings;

#9. Calculate the total booking value of rides completed successfully:

select * from bookings;
create view total_booking_value_Success_Rides AS
select sum(Booking_Value) 
as Total_Booking_Value
from bookings
where Booking_Status = "Success";

select * from total_booking_value_Success_Rides;

#10. List all incomplete rides along with the reason:
create view incomplete_rides_with_Reasons AS
select Booking_ID, Vehicle_Type, Incomplete_Rides, Incomplete_Rides_Reason
from bookings 
where Incomplete_Rides = "Yes";

select * from incomplete_rides_with_Reasons; 