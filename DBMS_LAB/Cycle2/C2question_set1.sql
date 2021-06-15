CREATE DATABASE cycle2;
USE cycle2;
CREATE TABLE SAILORS(
sid int(5),
sname varchar(10),
rating int(5),
age int
);
CREATE TABLE BOATS(
bid int(5),
bname varchar(10),
color varchar(10)
);
CREATE TABLE RESERVES(
sid int(5),
bid int(5),
day_res date
);
INSERT INTO SAILORS
VALUES(22 ,'Dustin', 7, 45), (29 ,'Brutas' ,1 ,33), 
(31 ,'Lubber ',8 ,55), (32 ,'Andy', 8, 25), 
(58 ,'Rusty ',10 ,35), (64,' Horatio', 7, 35),
(71,' Zorba', 10, 16), (74, 'Horatio', 9, 35), 
(85, 'Art', 3, 26), (95, 'Bob', 3, 64 );
INSERT INTO BOATS 
VALUES(101 ,'Interlake','Blue'),  (102 ,'Interlake', 'Red'), 
(103, 'Clipper', 'Green'), (104, 'Marine','Red');
INSERT INTO RESERVES
VALUES
(22 ,101 ,'1998-10-10'), (22 ,102, '1998-10-10'), 
(22 ,103, '1998-08-10'),(22 ,104, '1998-07-10'), 
(31 ,102, '1998-10-11'), (31 ,103, '1998-06-11'), 
(31 ,104, '1998-12-11'), (64 ,101, '1998-05-09'), 
(64 ,102, '1998-08-09'), (74 ,103, '1998-08-09'); 

SELECT sname,age FROM SAILORS;

select * from SAILORS , RESERVES WHERE SAILORS.sid = RESERVES.sid AND bid = 101; 

select sname from SAILORS where rating > 7;

select sname from SAILORS,RESERVES where SAILORS.sid = RESERVES.sid AND bid = 103;

select distinct sname from SAILORS,RESERVES,BOATS where color = 'Red' and SAILORS.sid = RESERVES.sid and BOATS.bid = RESERVES.bid; 

select distinct sname from SAILORS,RESERVES,BOATS WHERE (COLOR = 'Red' or COLOR ='Green') and 
SAILORS.sid = RESERVES.sid and BOATS.bid = RESERVES.bid; 

SELECT DISTINCT color from BOATS B,SAILORS S,RESERVES R WHERE sname = 'Lubber' and B.bid = R.bid and
S.sid =  R.sid;

select distinct sname from SAILORS,BOATS,RESERVES where (BOATS.color ='Red' or BOATS.color = 'Green') and BOATS.bid = RESERVES.bid 
and SAILORS.sid = RESERVES.sid;

SELECT sname,reserves.sid from SAILORS,RESERVES where SAILORS.sid =  RESERVES.sid group by day_res,RESERVES.sid,sname
HAVING COUNT(day_res) > 1; 

SELECT sname ,age from SAILORS WHERE age = (select min(age) from SAILORS);

select sname from sailors where rating > (select max(rating) from SAILORS WHERE sname = 'Horatio');

SELECT sname from SAILORS,BOATS,RESERVES WHERE (bid = 101 and bid = 102 and bid = 103 and bid = 104); 


SELECT SID,SNAME  FROM SAILORS  WHERE NOT EXISTS ( SELECT BID FROM BOATS 
 WHERE NOT EXISTS ( SELECT RESERVES.BID FROM RESERVES  WHERE RESERVES.SID = SAILORS.SID  AND RESERVES.BID=BOATS.BID));

 SELECT COUNT(c.sname)FROM
(SELECT DISTINCT sname FROM Sailors) c;

SELECT AVG(age) from SAILORS;

SELECT rating,AVG(age) from SAILORS GROUP BY rating;

 SELECT a.rating,b.mean FROM
(SELECT COUNT(sname) AS num,rating
FROM SAILORS GROUP BY rating
HAVING COUNT(sname)>1) a, 
(SELECT rating,AVG(age) AS mean FROM SAILORS 
 GROUP BY rating ) b
 WHERE a.rating = b.rating;
