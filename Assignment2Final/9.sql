.print Question 9 - nserrano
CREATE VIEW ride_info(rno,booked,available,rdate,price,src,dst)
AS SELECT r.rno, COALESCE(SUM(b.seats),0) TotalBook, r.seats-COALESCE(SUM(b.seats),0),r.rdate,r.price,L1.city,L2.city
FROM rides r left join bookings b on r.rno = b.rno left join locations L1 on r.src = L1.lcode left join 
locations L2 on r.dst = L2.lcode
group by r.rno;
--COMPLETE


