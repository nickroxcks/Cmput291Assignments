.print Question 3 - nserrano
SELECT DISTINCT members.email
FROM members, rides, locations, bookings
WHERE (members.email = bookings.email) and (bookings.rno = rides.rno) and (rides.rdate LIKE '2018-11%')
and (rides.dst = locations.lcode) and (locations.city = 'Calgary')
INTERSECT
SELECT DISTINCT members.email
FROM members, rides, locations, bookings
WHERE (members.email = bookings.email) and (bookings.rno = rides.rno) and (rides.rdate LIKE '2018-11%')
and (rides.src = locations.lcode) and (locations.city = 'Edmonton');