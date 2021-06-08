CREATE DATABASE TASK1;
USE  TASK1;

CREATE TABLE EMP(
empno int (2),
ename varchar(25),
job varchar(12),
salary int(12),
commission  int(7),
deptno int(2)
);

describe EMP;

INSERT INTO EMP(empno,ename,job,salary,deptno) values(
7369,'SMITH','Clerk',800,20
);

INSERT INTO EMP(empno,ename,job,salary,commission,deptno)VALUES
(7499,'ALLEN','SALESMAN',1600,300,30),
(7521,'WARD','SALESMAN',1250,500,30),
(7566,'JONES','MANAGER',2975,NULL,20),
(7654,'MARTIN','SALESMAN',1250,1400,30),
(7698,'BLAKE','MANAGER',2850,NULL,30),
(7782,'CLARK','MANAGER',2450,NULL,10),
(7788,'SCOTT','ANALYST',3000,NULL,20),
(7839,'KING','PRESIDENT',5000,NULL,10),
(7844,'TURNER','SALESMAN',1500,NULL,30),
(7876,'ADAMS','CLERK',1100,NULL,20),
(7900,'JAMES',NULL,950,NULL,30),
(7902,'FORD','ANALYST',3000,NULL,20),
(7934,'MILLER','CLERK',1300,NULL,10);
SET SQL_SAFE_UPDATES =0;
UPDATE EMP SET job = 'CLERK' where job IS NULL;

ALTER TABLE EMP  
ADD date_join date NOT NULL; 
UPDATE EMP 
SET date_join='1980-12-17' WHERE empno='7369';
UPDATE EMP 
SET date_join='1981-02-20' WHERE empno='7499';
UPDATE EMP 
SET date_join='1981-02-22' WHERE empno='7521';
UPDATE EMP 
SET date_join='1981-04-02' WHERE empno='7566';
UPDATE EMP 
SET date_join='1981-09-28' WHERE empno='7654';
UPDATE EMP 
SET date_join='1981-05-01' WHERE empno='7698';
UPDATE EMP 
SET date_join='1981-06-09' WHERE empno='7782';
UPDATE EMP 
SET date_join='1981-04-19' WHERE empno='7788';
UPDATE EMP 
SET date_join='1981-11-17'WHERE empno='7839';
UPDATE EMP 
SET date_join='1981-09-08' WHERE empno='7844';
UPDATE EMP 
SET date_join='1987-05-23' WHERE empno='7876';
UPDATE EMP 
SET date_join='1981-12-03' WHERE empno='7900';
UPDATE EMP 
SET date_join='1981-12-03' WHERE empno='7902';
UPDATE EMP 
SET date_join='1982-01-23' WHERE empno='7934';

SELECT * FROM EMP;

SELECT DISTINCT job FROM EMP;

SELECT ename,deptno
FROM EMP
WHERE deptno IN (20, 30);

UPDATE EMP SET commission=0 WHERE commission IS NULL;
SELECT ename ,salary+commission AS total_salary from EMP;

SELECT ename ,salary*12 AS annual_salary FROM EMP;

SELECT * FROM EMP WHERE date_join = '1981-12-03';

SELECT ename,salary FROM EMP WHERE ename = 'MILLER';  

DELETE FROM EMP WHERE ename = 'MILLER';
SELECT * FROM EMP;

SELECT ename,deptno FROM EMP;

ALTER TABLE EMP
ADD COLUMN total_salary INT; 
UPDATE EMP SET total_salary=(SELECT salary+commission AS total_salary);
ALTER TABLE EMP DROP COLUMN commission;

SELECT E.empno,E.ename,E.salary FROM EMP E INNER JOIN EMP B ON E.salary=B.salary AND E.empno<>B.empno;

SELECT empno AS EMP_ID, ename AS 'NAME'
FROM EMP;

ALTER TABLE EMP
RENAME TO EMPLOYEE;
describe EMPLOYEE;

create table EMP_TAB as select * from EMPLOYEE;
describe EMP_TAB;

select * from EMPLOYEE join EMP_TAB;

truncate table EMPLOYEE; 

drop table EMPLOYEE;
describe EMPLOYEE;


create table EMPLOYEE SELECT * FROM EMP_TAB;
SELECT * FROM EMPLOYEE;

SELECT distinct e.empno,e.ename,e.job,e.salary,e.deptno,e.date_join,e.total_salary,
b.empno,b.ename,b.job,b.salary,b.deptno,b.date_join,b.total_salary FROM EMP_TAB e  JOIN 
EMPLOYEE b where e.empno=b.empno;
