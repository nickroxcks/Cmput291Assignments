.print Question 8 - nserrano
Select mytable.driver
from
    (Select DISTINCT rides.driver , count(locations.prov) NumOffered
	from rides left join locations ON rides.dst = locations.lcode
	where locations.prov = 'Alberta' and DATE(rides.rdate) >= '2016-00-00'
	group by rides.driver
	) mytable
where mytable.NumOffered >  
--total ammount locations in alberta / 2
(Select count(*)
from locations
where locations.prov = 'Alberta')/2;
--compleete

