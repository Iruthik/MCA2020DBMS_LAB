create database cycle3;
use cycle3;
create table EMPLOYEE(
SSN int not null ,
ENAME varchar(20) not null,
DESIG varchar(20),
DNO int,
DOJ date,
SALARY double,
PRIMARY KEY(SSN)
);
CREATE TABLE DEPARTMENT (
DNumber int not null,
DName varchar(20) not null,
LOC varchar(20),
MGRSSN Int
REFERENCES EMPLOYEE(SSN),
 PRIMARY KEY (DNumber)
);
CREATE TABLE PROJECT(
PNumber int,
Pname varchar(20) not null,
Dnum int,
FOREIGN KEY(Dnum) REFERENCES DEPARTMENT(DNumber),
PRIMARY KEY(PNumber)
);

CREATE TABLE WORKS_IN (
ESSN INT,
PNO INT,
Hours int,
FOREIGN KEY(ESSN) REFERENCES EMPLOYEE(SSN) ,
FOREIGN KEY (PNO) REFERENCES PROJECT (PNumber),
FOREIGN KEY (Hours) REFERENCES DEPARTMENT(DNumber)
);

INSERT INTO EMPLOYEE(SSN,ENAME,DESIG,DNO,DOJ,SALARY) VALUES
(1,'Abhi','HR',2,'2009-04-12',70000),(2,'bhama','admin',1,'2008-03-10',75000 ),
(3,'chriz','sales',3,'2015-06-23',35000 ),(4,'diya','production',5,'2015-07-21',32000 ),
(5,'govind','production',5,'2015-09-12',35000 ),(6,'hima','finance',4,'2013-01-19',51000 ),
(7,'ira','hr',2,'2010-03-15',45000 ),(8,'sandeep','finance',4,'2010-07-26',49000 );
SELECT * FROM EMPLOYEE;

INSERT INTO DEPARTMENT(DNumber,DName,LOC)VALUES
(1,'Admin','Chennai'),(2,'HR','Banglore'),
(3,'Sales','Kochi'),(4,'Finance','Delhi'),
(5,'Production','Trivandrum');
SELECT * FROM DEPARTMENT;

UPDATE department SET mgrssn=2 WHERE dnumber=1;
UPDATE department SET mgrssn=1 WHERE dnumber=2; 
UPDATE department SET mgrssn=3 WHERE dnumber=3; 
UPDATE department SET mgrssn=6 WHERE dnumber=4; 
UPDATE department SET mgrssn=7 WHERE dnumber=2;
UPDATE department SET mgrssn=4 WHERE dnumber=5; 
UPDATE department SET mgrssn=5 WHERE dnumber=5;  
SELECT * FROM DEPARTMENT;

INSERT INTO PROJECT(PNumber,Pname,Dnum)VALUES
(11,'Bancs',3),(12,'Nielesan',5),
(13,'WorldBank',1),(14,'Airlines',2),(15,'Amex',4);
SELECT * FROM PROJECT;

INSERT INTO WORKS_IN(ESSN,PNO,HOURS)VALUES(1,14,NULL),(4,13,NULL),(8,12,NULL),
(6,15,NULL),(2,11,NULL),(3,13,NULL);
SELECT * FROM WORKS_IN;

SELECT e.ENAME FROM EMPLOYEE e LEFT OUTER JOIN DEPARTMENT d on d.DNUMBER=e.DNO
WHERE e.SALARY BETWEEN 30000 AND 40000 AND d.DNumber=5;

SELECT e.ENAME,d.DNAME FROM EMPLOYEE e LEFT OUTER JOIN DEPARTMENT d on e.DNO=d.DNumber
ORDER BY d.DName ASC,e.ENAME ASC;
describe DEPARTMENT;

SELECT p.PNUMBER,p.PNAME,count(e.SSN) FROM WORKS_IN w LEFT OUTER JOIN PROJECT p on
w.PNO=p.PNUMBER LEFT OUTER JOIN EMPLOYEE e on w.ESSN=e.SSN GROUP BY
p.PNAME,p.PNUMBER;

SELECT p.PNumber,p.Pname,count(e.SSN) as 'Number of employee' FROM WORKS_IN w LEFT OUTER JOIN PROJECT p on
w.PNO=p.PNumber LEFT OUTER JOIN EMPLOYEE e on w.ESSN=e.SSN GROUP BY
p.Pname,p.PNumber HAVING count(e.SSN) > 2;

SELECT p.PNUMBER,p.PNAME,d.DNUMBER,count(e.ssn) FROM PROJECT p LEFT OUTER JOIN
DEPARTMENT d on d.DNUMBER=p.DNUM LEFT OUTER JOIN EMPLOYEE e on e.DNO=p.DNUM
GROUP BY p.PNAME,p.PNUMBER,d.DNUMBER HAVING d.DNUMBER=5;

SELECT d.DNAME,d.DNUMBER,e.SSN,e.ENAME,e.DESIG,e.DOJ,e.SALARY FROM DEPARTMENT d,EMPLOYEE e 
WHERE  (SELECT COUNT(*) FROM EMPLOYEE e WHERE e.DNO = d.DNUMBER AND e.SALARY> 40000) > 4 AND 
e.DNO=d.DNUMBER GROUP BY d.DNAME,d.DNUMBER,e.SSN,e.ENAME,e.DESIG,e.DOJ,e.SALARY;

/*8Use the tables Employee, and Department. Perform the operations as mentioned below: */
/*(a)Display the employee details, departments that the departments are same in 
both the emp and dept. (Equi-join)*/
SELECT * From 	EMPLOYEE E,DEPARTMENT D WHERE E.DNO=D.DNumber;

/*b)Non Equi Join*/
SELECT * FROM EMPLOYEE E,DEPARTMENT D WHERE NOT (E.DNO = D.DNumber);

/*c)Left Outer Join Join*/
SELECT * FROM EMPLOYEE E LEFT OUTER JOIN DEPARTMENT D ON E.DNO=D.DNumber;

/*d)Right Outer Join*/
SELECT * FROM EMPLOYEE E RIGHT OUTER JOIN DEPARTMENT D ON E.DNO=D.DNumber;

/*e)Inner Join*/
SELECT * FROM EMPLOYEE E INNER JOIN DEPARTMENT D ON E.DNO=D.DNumber;






