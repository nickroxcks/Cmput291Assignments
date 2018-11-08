.print Question 6 - nserrano
SELECT a.city, b.prov, a.TotalRidesFrom, b.TotalRidesTo, c.TotalEnroutes
FROM
	(SELECT testable1.city, testable1.prov, SUM(RidesFrom) AS TotalRidesFrom  --sum the rides
	From
		(SELECT L1.city,L1.prov, (SELECT COUNT(rides.src)  --count # of found lcodes
			FROM rides
			WHERE L1.lcode = rides.src) 
		RidesFrom
		FROM locations L1) 
	testable1
	GROUP BY testable1.city)
a
LEFT JOIN
	(SELECT testable2.city, testable2.prov, SUM(RidesTo) AS TotalRidesTo
	FROM
		(SELECT L2.city,L2.prov, (SELECT COUNT(rides.dst)
			FROM rides
			WHERE L2.lcode = rides.dst) 
		RidesTo
		FROM locations L2) 
	testable2
	GROUP BY testable2.city) 
b
ON a.city = b.city
LEFT JOIN
	(SELECT testable3.city,testable3.prov, SUM(EnrouteNum) AS TotalEnroutes
	FROM
		(SELECT L3.city, L3.prov, (SELECT COUNT(enroute.lcode)
			FROM enroute
			WHERE L3.lcode = enroute.lcode)
		EnrouteNum
		From locations L3)
	testable3
	GROUP BY testable3.city)
c
ON (b.city = c.city);
--COMPLETE








