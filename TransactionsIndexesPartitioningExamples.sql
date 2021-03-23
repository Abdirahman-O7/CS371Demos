-- --------------------------------------------------------------------------------------------------------------------------
-- Lecture 21-- Transactions, Indexes and Table Paritioning
-- --------------------------------------------------------------------------------------------------------------------------


-- --------------------------------------------------------------------------------------------------------------------------
-- Slides 6-8 (Transactions)
-- --------------------------------------------------------------------------------------------------------------------------

SELECT *
FROM Accounts;

START TRANSACTION;

UPDATE Accounts
SET AvailableBalance=AvailableBalance-50 
WHERE Account_ID=1;

UPDATE Accounts
SET AvailableBalance=AvailableBalance+50
WHERE Account_ID=2;

COMMIT;

SELECT *
FROM Accounts;

SET AUTOCOMMIT=0;

-- --------------------------------------------------------------------------------------------------------------------------
-- Slide 10 (Storage)
-- --------------------------------------------------------------------------------------------------------------------------

SHOW TABLE STATUS LIKE 'Accounts';

ALTER TABLE Transactions ENGINE= INNODB;

-- --------------------------------------------------------------------------------------------------------------------------
-- Slides 11, 12 (Savepoints)
-- --------------------------------------------------------------------------------------------------------------------------

START TRANSACTION;

INSERT INTO Transactions (Account_ID,TrnsType,TrnsAmount,Employee_ID) 
VALUES(1,'CDT',400,1);

SAVEPOINT before_adding_transaction;

UPDATE Accounts
SET LastActivityDate=CURRENT_DATE()
WHERE Account_ID=1;

ROLLBACK TO SAVEPOINT before_adding_transaction;
COMMIT;

SELECT *
FROM Accounts;

-- --------------------------------------------------------------------------------------------------------------------------
-- Slides 13, 14 (User-defined Variables)
-- --------------------------------------------------------------------------------------------------------------------------

SET @FName='Frank';
SET @LName='Tucker';

SELECT CustFirst_Name,CustLast_Name
FROM Customers
WHERE CustFirst_Name=@FName AND CustLast_Name=@LName;

SET @FullName=CONCAT(@FName,' ',@LName);

SELECT CustFirst_Name,CustLast_Name
FROM Customers
WHERE CONCAT(CustFirst_Name,' ',CustLast_Name)=@FullName;

-- --------------------------------------------------------------------------------------------------------------------------
-- Slides 15-17 (Problem & Solution)
-- --------------------------------------------------------------------------------------------------------------------------

SET @checking_account_id=
(
SELECT Account_ID
FROM Accounts
INNER JOIN Customers
WHERE Accounts.Customer_ID=Customers.Customer_ID AND CustFirst_Name='Frank' AND CustLast_Name='Tucker' AND Account_Type_ID='CHK'
LIMIT 1
);

SET @saving_account_id=
(
SELECT Account_ID
FROM Accounts
INNER JOIN Customers
WHERE Accounts.Customer_ID=Customers.Customer_ID AND CustFirst_Name='Frank' AND CustLast_Name='Tucker' AND Account_Type_ID='SAV'
LIMIT 1
);

START TRANSACTION;

INSERT INTO Transactions (Account_ID,TrnsType,TrnsAmount,Employee_ID) 
VALUES(@checking_account_id,'DBT',-500,1);

INSERT INTO Transactions (Account_ID,TrnsType,TrnsAmount,Employee_ID) 
VALUES(@saving_account_id,'DBT',500,1);

COMMIT;

-- --------------------------------------------------------------------------------------------------------------------------
-- Slides 18-26 (Indexes)
-- --------------------------------------------------------------------------------------------------------------------------

ALTER TABLE Departments
ADD INDEX dept_name_idx (DeptName);

ALTER TABLE Departments
DROP INDEX dept_name_idx;

ALTER TABLE Departments
ADD UNIQUE dept_name_idx (DeptName);

ALTER TABLE Employees
ADD INDEX emp_name_idx (EmpFirst_Name,EmpLast_Name);

SELECT Employee_ID,EmpFirst_Name,EmpLast_Name
FROM Employees
WHERE Employee_ID IN (1,3,9,15);

EXPLAIN SELECT Employee_ID,EmpFirst_Name,EmpLast_Name
FROM Employees
WHERE Employee_ID IN (1,3,9,15);

-- --------------------------------------------------------------------------------------------------------------------------
-- Slides 27-30 (Partitioning)
-- --------------------------------------------------------------------------------------------------------------------------

CREATE TABLE sale_mast (
bill_no INT NOT NULL, 
bill_date TIMESTAMP NOT NULL, 
cust_code VARCHAR(15) NOT NULL, 
amount DECIMAL(8,2) NOT NULL) 
PARTITION BY RANGE (UNIX_TIMESTAMP(bill_date))( 
PARTITION p0 VALUES LESS THAN (UNIX_TIMESTAMP('2013-04-01')), 
PARTITION p1 VALUES LESS THAN (UNIX_TIMESTAMP('2013-07-01')), 
PARTITION p2 VALUES LESS THAN (UNIX_TIMESTAMP('2013-10-01')), 
PARTITION p3 VALUES LESS THAN (UNIX_TIMESTAMP('2014-01-01'))); 

INSERT INTO sale_mast (bill_no, bill_date, cust_code, amount)
VALUES (513, '2010-01-01 10:10:10', '1001', '0.00'),
(223, ' 2010-12-31 23:40:10', '1002', '52.03'),
(821, ' 2010-01-01 13:10:10 ', '1003', '100.00'),
(001, '2010-12-31 23:40:10', '1004', '516.24');

SELECT *
FROM sale_mast;

DROP TABLE sale_mast;

CREATE TABLE sale_mast (
bill_no INT NOT NULL, 
bill_date TIMESTAMP NOT NULL, 
agent_code INT NOT NULL, 
amount DECIMAL(8,2) NOT NULL) 
PARTITION BY LIST(agent_code) ( 
PARTITION pA VALUES IN (1,2,3), 
PARTITION pB VALUES IN (4,5,6), 
PARTITION pC VALUES IN (7,8,9,10,11)); 

SELECT *
FROM Transactions;

ALTER TABLE Transactions PARTITION BY HASH(Transaction_id) PARTITIONS 6; 

SELECT *
FROM Transactions;

