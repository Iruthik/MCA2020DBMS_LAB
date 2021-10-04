#SET 1
CREATE TABLE CUSTOMERS
(
CID INT PRIMARY KEY,
CNAME VARCHAR(25)NOT NULL,
LOC VARCHAR(25),
SEX VARCHAR(25),
DOB DATE
);
CREATE TABLE BBANK_BRN
(
BCODE INT PRIMARY KEY,
BLOC VARCHAR(25) NOT NULL,
BSTATE VARCHAR(25) NOT NULL
);
CREATE TABLE DEPOSITS
(
DACNO INT PRIMARY KEY,
DDATE DATE NOT NULL,
DAMT INT NOT NULL,
DTYPE VARCHAR(25) NOT NULL
);
CREATE TABLE LOANS
(
LACNO INT PRIMARY KEY,
LDATE  DATE NOT NULL,
LAMT INT NOT NULL,
LTYPE VARCHAR(25) NOT NULL
);
CREATE TABLE AACCOUNTS_IN
(
CID INT NOT NULL,
BCODE INT NOT NULL,
FOREIGN KEY(BCODE) REFERENCES BBANK_BRN(BCODE),
FOREIGN KEY (CID) REFERENCES CUSTOMERS(CID)
);
CREATE TABLE DEPOSITORS
(
 CID INT NOT NULL,
DACNO INT NOT NULL,
FOREIGN KEY(DACNO) REFERENCES DEPOSITS(DACNO),
FOREIGN KEY (CID) REFERENCES CUSTOMERS(CID)
);
CREATE TABLE BORROWERS
(
CID INT NOT NULL,
LACNO INT NOT NULL,
FOREIGN KEY(LACNO) REFERENCES LOANS(LACNO),
FOREIGN KEY(CID) REFERENCES CUSTOMERS(CID)
);
DESCRIBE CUSTOMERS;
DESCRIBE BANK.BORROWERS;
SHOW TABLES;
 DESCRIBE LOANS;
 DESCRIBE AACCOUNTS_IN;
drop table CUSTOMERS,BORROWERS,AACCOUNTS_IN,DEPOSITORS;
DROP TABLE DEPOSITOR;