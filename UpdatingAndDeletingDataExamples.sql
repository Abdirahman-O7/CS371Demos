-- --------------------------------------------------------------------------------------------------------------------------
-- Lecture 17-- Updating and Deleting Data
-- --------------------------------------------------------------------------------------------------------------------------


-- --------------------------------------------------------------------------------------------------------------------------
-- Slide 2 (Updating Data)
-- --------------------------------------------------------------------------------------------------------------------------
SELECT *
FROM Employees;

UPDATE Employees 
SET EmpFirst_Name='Scott', EmpLast_Name='Johns'
WHERE Employee_ID='1';

SELECT *
FROM Employees;

-- --------------------------------------------------------------------------------------------------------------------------
-- Slides 3-5 (Problem & Solution)
-- --------------------------------------------------------------------------------------------------------------------------

UPDATE Accounts 
INNER JOIN Branches
ON Accounts.Branch_ID=Branches.Branch_ID
SET AcctStatus='CLOSED'
WHERE Branches.State_ID='NH';

SELECT *
FROM Accounts
INNER JOIN Branches
ON Accounts.Branch_ID=Branches.Branch_ID;


UPDATE Accounts -- Same result as line 22
SET AcctStatus='CLOSED'
WHERE Accounts.Branch_ID IN (
 SELECT Branch_ID FROM Branches
 WHERE State_ID='NH'
);

-- --------------------------------------------------------------------------------------------------------------------------
-- Slide 6 (Deleting Data)
-- --------------------------------------------------------------------------------------------------------------------------

SELECT *
FROM Customers;

DELETE FROM Customers 
WHERE Customer_ID='8';

SELECT *
FROM Customers;

-- --------------------------------------------------------------------------------------------------------------------------
-- Slides 7-9 (Problem & Solution)
-- --------------------------------------------------------------------------------------------------------------------------

DELETE A FROM Accounts A
INNER JOIN Branches B
ON A.Branch_ID=B.Branch_ID
WHERE B.State_ID='NH';

SELECT *
FROM Accounts
INNER JOIN Branches
ON Accounts.Branch_ID=Branches.Branch_ID;

DELETE FROM Accounts -- Same result as above
WHERE Accounts.Branch_ID IN (
 SELECT Branch_ID FROM Branches
 WHERE State_ID='NH'
);

SELECT *
FROM Accounts;

SELECT *
FROM Branches;

