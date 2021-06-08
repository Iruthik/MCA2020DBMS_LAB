CREATE TABLE loan_accounts(accno CHAR(4),
cust_name VARCHAR(15),loan_amount DECIMAL(10,2),
installments INT(5),int_rate DECIMAL(10,2),
start_date DATE,interest DECIMAL(10,2)
);
ALTER TABLE loan_accounts 
ADD COLUMN (category VARCHAR (1));
INSERT INTO  loan_accounts(accno,cust_name,loan_amount,installments,int_rate,start_date,interest)
VALUES('1001','R.K.Gupta',300000.00,36,12.00,'2009-07-19',null),
('1002','S.P.Sharma',500000.00, 48, 10.00,'2008-03-22',NULL),
('1003', 'K.P Jain' ,300000.00 ,36,null,'2007-08-03',NULL),
('1004','M.P.Yadhav',800000.00,60,10.00,'2008-06-12',NULL),
('1005','S.P.Sinha',200000.00,36,12.50,'2010-03-01',NULL),
('1006','P.Sharma',700000.00,60,12.50,'2008-05-06',NULL),
('1007','K.S.Dhall',500000.00,48,null,'2008-05-03',NULL);


SET SQL_SAFE_UPDATES=0;
update loan_accounts set int_rate = 11.50 where int_rate is null;

update loan_accounts set int_rate = int_rate + 0.5 where loan_amount > 400000.00;

update loan_accounts set interest = (loan_amount * int_rate* installments)/(12*100) where interest is null; 


DELETE FROM loan_accounts WHERE start_date < '2008-01-01';


delete FROM loan_accounts where cust_name like 'K%';

SELECT * FROM loan_accounts where installments < 40;

SELECT accno,loan_amount, start_date from loan_accounts where start_date < '2009-04-01';

select int_rate ,start_date from loan_accounts where start_date > '2009-04-01';

SELECT accno,cust_name,loan_amount FROM loan_accounts WHERE cust_name LIKE '%Sharma';

select loan_amount from loan_accounts where cust_name like '%a';

select accno,cust_name,loan_amount from loan_accounts where cust_name like'%a%';

select accno,cust_name,loan_amount from loan_accounts where cust_name not like '%p%';

describe loan_accounts;

select * from loan_accounts order by loan_amount asc;

select * from loan_accounts order by start_date desc;

select accno,cust_name,loan_amount from loan_accounts where cust_name like 'k%';

select * from loan_accounts where int_rate is null;
 
select * from loan_accounts where int_rate is not null;
 
 select distinct loan_amount from loan_accounts ;
 
 SELECT * FROM loan_accounts where (start_date > '2008-12-31' and installments > 36);
 
 select cust_name,loan_amount from loan_accounts where (loan_amount < 500000.00 or int_rate > 12);
 
 select * from loan_accounts where start_date between '2009-01-01' and '2009-12-31';
 
 select * from loan_accounts where loan_amount between 400000.00 and 500000.00;
 
 select cust_name,installments, loan_amount from loan_accounts where installments in( 26,36,48);
 
 update loan_accounts set int_rate =0.0 where int_rate is null;
 select cust_name,loan_amount,int_rate from loan_accounts where int_rate = 0.0;
 
 SELECT cust_name,loan_amount,int_rate  from student where int_rate is null ;
 /*16 th question*/
 select * from loan_accounts order by loan_amount desc,start_date desc;
 select * from loan_accounts;
 
 select cust_name,loan_amount,ifnull(int_rate,'No Interest') as int_rate from loan_accounts;