.print Question 7 - nserrano
SELECT tab1.rno
FROM
	--this table tab1 is a table that list rides and prices with available seats. If a rno is not booked, the rno is automatically listed
	--if the rno is booked, we check to see if there are any seats left by going, (rides.seats-bookings.seats) > 0
	(SELECT DISTINCT rides.rno, rides.price
	FROM rides r1, rides, locations L1, locations L2, bookings
	WHERE ((rides.src = L1.lcode) and (L1.city = 'Edmonton') and (rides.dst = L2.lcode) and (L2.city = 'Calgary')
	and (rides.rdate LIKE '2018-10%') and (rides.rno <> bookings.rno)) OR ((rides.src = L1.lcode) and (L1.city = 'Edmonton') 
	and (rides.dst = L2.lcode) and (L2.city = 'Calgary') and (rides.rdate LIKE '2018-10%') and (rides.rno = bookings.rno) and ((rides.seats-bookings.seats) > 0)))
tab1
--select the rno where the price is equal to the minimum price of rides. Doing this will allow to list the cheapest ride. 
--Or if there are multiple rno's that do indeed have the minimum price, those will be listed as well.
where tab1.price =
	(SELECT min(rides.price)
	from rides, locations L1, locations L2, bookings
	WHERE (rides.src = L1.lcode) and (L1.city = 'Edmonton') and (rides.dst = L2.lcode) and (L2.city = 'Calgary')
	and (rides.rdate LIKE '2018-10%') and (rides.rno <> bookings.rno));

--the cheapest ride from Edmonton to Calgary." In the set of rides from Edmonton to Calgary with available seats*
