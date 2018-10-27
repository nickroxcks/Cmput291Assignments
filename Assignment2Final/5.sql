.print Question 5 - nserrano
SELECT DISTINCT city
FROM 

(SELECT testable2.city, testable2.prov, SUM(RidesTo) AS TotalRidesTo
	FROM
		(SELECT L2.city,L2.prov, (SELECT COUNT(rides.dst)
			FROM rides
			WHERE L2.lcode = rides.dst) 
		RidesTo
		FROM locations L2) 
	testable2
	GROUP BY testable2.city
	ORDER BY TotalRidesTo desc)
LIMIT 3;
--COMPLETE
--CHANGEEEEEEEEEEEE