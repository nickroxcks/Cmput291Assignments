.print Question 1 - nserrano
SELECT DISTINCT members.name, members.email
FROM cars c1, cars c2, rides, members
WHERE ((members.email = c1.owner) and (c1.owner = c2.owner) and (c1.cno<>c2.cno)) and ((c1.cno = rides.cno) or (c2.cno = rides.cno));
--COMPLETE