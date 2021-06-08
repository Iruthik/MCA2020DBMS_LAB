USE task1;
CREATE TABLE STUDENT(
SID INT(2) PRIMARY KEY, 
SNAME VARCHAR(25),
DOB DATE,
MARK_PHYSICS INT(10),
MARK_CHEMISTRY INT(10),
MARK_MATHS INT(10)
);
INSERT INTO STUDENT VALUES(1,'ARUN JYOTHI','1980-12-8',98,94,100),
                           (2,'VARUN JYOTHI','1987-9-24',98,96,97),
                           (3,'SACHIN JP','1998-04-05',94,92,90),
                           (4,'YRUTHIKA LAKSHMI','1995-08-23',98,97,96),
                           (5, 'SOURAV JP','2000-07-26',90,95,97);

SELECT SID,SNAME FROM STUDENT 
WHERE DOB = (SELECT MAX(DOB) FROM STUDENT);  

UPDATE STUDENT SET MARK_PHYSICS = 100 , MARK_CHEMISTRY = 99, MARK_MATHS = 30 WHERE SID = 4;         

SELECT * FROM STUDENT WHERE MARK_MATHS >= 40 AND (MARK_PHYSICS >= 40 OR MARK_CHEMISTRY >= 40);

ALTER TABLE STUDENT ADD TOTAL INT(10);
ALTER TABLE STUDENT ADD AVERAGE FLOAT(15);
DESCRIBE STUDENT;

SELECT SID,SNAME,MARK_MATHS FROM STUDENT WHERE MARK_MATHS = (SELECT MAX(MARK_MATHS) FROM STUDENT);

SELECT SNAME,MARK_CHEMISTRY FROM STUDENT WHERE MARK_CHEMISTRY = (SELECT MIN(MARK_CHEMISTRY)FROM STUDENT);

SET SQL_SAFE_UPDATES=0;
UPDATE STUDENT SET TOTAL = MARK_PHYSICS + MARK_CHEMISTRY +MARK_MATHS;
SELECT * FROM STUDENT;

SELECT * FROM STUDENT
ORDER BY TOTAL DESC;

ALTER TABLE STUDENT
RENAME COLUMN AVERAGE TO AVG_MARK;
DESCRIBE STUDENT;

SELECT AVG(AVG_MARK) AS OVERALL_AVERAGE FROM STUDENT;

UPDATE STUDENT SET AVG_MARK = 0 WHERE AVG_MARK IS NULL;
UPDATE STUDENT SET AVG_MARK = TOTAL/3 WHERE AVG_MARK = 0;
SELECT * FROM STUDENT WHERE AVG_MARK > (SELECT AVG(AVG_MARK) FROM STUDENT) ;

SELECT COUNT(SNAME) FROM STUDENT  WHERE AVG_MARK > (SELECT AVG(AVG_MARK) FROM STUDENT) ;