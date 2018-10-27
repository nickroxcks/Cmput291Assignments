.print Question 2 - nserrano
SELECT DISTINCT members.name, members.email
FROM members, rides, cars, bookings
WHERE (members.email = cars.owner) and (cars.seats = bookings.seats)
EXCEPT
SELECT members.name, rides.driver
FROM members, rides;
--COMPLETE