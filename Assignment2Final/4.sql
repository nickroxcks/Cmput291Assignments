.print Question 4 - nserrano
SELECT requests.rid,requests.email,requests.pickup,requests.dropoff,rides.rno
FROM requests,rides,locations startreq, locations startrid, locations finreq, locations finrid
WHERE (requests.rdate = rides.rdate) and (rides.price<=requests.amount) and (requests.pickup = startreq.lcode)
and (requests.dropoff = finreq.lcode) and (rides.src = startrid.lcode) and (rides.dst = finrid.lcode) 
and (startreq.city = startrid.city) and (finreq.prov = finrid.prov);
--COMPLETE 