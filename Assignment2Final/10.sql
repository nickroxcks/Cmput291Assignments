.print Question 10 - nserrano
SELECT ride_info.rno, ride_info.booked, ride_info.available,
ride_info.rdate, ride_info.price, ride_info.src, ride_info.dst,
members.email,(julianday('2019-01-01') - julianday(ride_info.rdate)) Timesince
FROM ride_info, members, rides
Where (ride_info.src = 'Edmonton') and (ride_info.dst = 'Calgary') and 
(ride_info.rdate LIKE '2018-12%') and (ride_info.rno = rides.rno) and 
(rides.driver = members.email)
Order By ride_info.price;
--COMPLETE


