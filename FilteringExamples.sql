-- --------------------------------------------------------------------------------------------------------------------------
-- Lecture 15-- Filtering
-- --------------------------------------------------------------------------------------------------------------------------

-- --------------------------------------------------------------------------------------------------------------------------
-- Slide 4 & 5 (Problem & Solution)
-- --------------------------------------------------------------------------------------------------------------------------

SELECT EmpFirst_Name,EmpLast_Name,EmpStart_Date,Department_ID
FROM Employees
WHERE EmpStart_Date>'2000-1-1' AND Department_ID=
(SELECT Department_ID FROM Departments WHERE DeptName='Loans');

-- --------------------------------------------------------------------------------------------------------------------------
-- Slide 6 & 7 (Problem & Solution)
-- --------------------------------------------------------------------------------------------------------------------------

SELECT EmpFirst_Name,EmpLast_Name,EmpSupervisor_ID
FROM Employees
WHERE EmpSupervisor_ID IS NULL;

SELECT EmpFirst_Name,EmpLast_Name,EmpSupervisor_ID
FROM Employees
WHERE EmpSupervisor_ID IS NOT NULL;

-- --------------------------------------------------------------------------------------------------------------------------
-- Slide 8 & 9 (Problem & Solution)
-- --------------------------------------------------------------------------------------------------------------------------

SELECT EmpFirst_Name,EmpLast_Name,EmpSupervisor_ID -- Without supervisorless employees
FROM Employees
WHERE EmpSupervisor_ID  <> 6; -- <> is !=

SELECT EmpFirst_Name,EmpLast_Name,EmpSupervisor_ID -- With supervisorless employees
FROM Employees
WHERE EmpSupervisor_ID <> 6 OR EmpSupervisor_ID IS NULL;

-- --------------------------------------------------------------------------------------------------------------------------
-- Slide 10 (Range Condition)
-- --------------------------------------------------------------------------------------------------------------------------

SELECT EmpFirst_Name,EmpLast_Name,EmpStart_Date -- standard mathematical comparisons
FROM Employees
WHERE EmpStart_Date >= '2002-01-01' AND EmpStart_Date < '2004-01-01';

SELECT EmpFirst_Name,EmpLast_Name,EmpStart_Date -- BETWEEN operator
FROM Employees
WHERE EmpStart_Date BETWEEN '2002-01-01' AND '2003-12-31';

-- --------------------------------------------------------------------------------------------------------------------------
-- Slide 11 & 12 (Membership Condition)
-- --------------------------------------------------------------------------------------------------------------------------

SELECT Account_ID, Account_Type_ID,Customer_ID
FROM Accounts
WHERE Account_Type_ID='CHK' OR Account_Type_ID='SAV' OR Account_Type_ID='CD';

SELECT Account_ID, Account_Type_ID,Customer_ID -- IN operator
FROM Accounts
WHERE Account_Type_ID IN ('CHK', 'SAV', 'CD');

SELECT Account_ID, Account_Type_ID,Customer_ID -- NOT IN operator
FROM Accounts
WHERE Account_Type_ID NOT IN ('CHK', 'SAV', 'CD');

-- --------------------------------------------------------------------------------------------------------------------------
-- Slide 13 & 14 (Problem & Solution)
-- --------------------------------------------------------------------------------------------------------------------------

SELECT Account_ID, Account_Type_ID,Employee_ID
FROM Accounts
WHERE Employee_ID IN (SELECT Employee_ID FROM Employees WHERE YEAR(EmpStart_Date)=2002);

-- --------------------------------------------------------------------------------------------------------------------------
-- Slide 15 (Any Operator)
-- --------------------------------------------------------------------------------------------------------------------------

SELECT * 
FROM Transactions
WHERE TrnsAmount > ANY -- ANY operator returns true if any of the subquery meets the conditions
(
	SELECT MAX(TrnsAmount)
	FROM Transactions
	GROUP BY TrnsType
);

-- --------------------------------------------------------------------------------------------------------------------------
-- Slide 16 (ALL Operator)
-- --------------------------------------------------------------------------------------------------------------------------

SELECT * 
FROM Transactions
WHERE TrnsAmount >= ALL -- ALL operator returns true if all of the subquery meets the conditions
(
SELECT MAX(TrnsAmount)
FROM Transactions
GROUP BY TrnsType
);

-- --------------------------------------------------------------------------------------------------------------------------
-- Slide 18 & 19 (Wildcards)
-- --------------------------------------------------------------------------------------------------------------------------

SELECT EmpLast_Name 
FROM Employees
WHERE EmpLast_Name LIKE '_a%e%';

SELECT EmpLast_Name 
FROM Employees
WHERE EmpLast_Name LIKE '_a%e%' COLLATE utf8mb4_bin;

-- --------------------------------------------------------------------------------------------------------------------------
-- Slide 20 & 21 (Problem & Solution)
-- --------------------------------------------------------------------------------------------------------------------------

SELECT EmpFirst_Name,EmpLast_Name
FROM Employees
WHERE EmpLast_Name LIKE 'F%' COLLATE utf8mb4_bin  OR EmpLast_Name LIKE 'G%' COLLATE utf8mb4_bin;

-- --------------------------------------------------------------------------------------------------------------------------
-- Slide 18 & 19 (RegEx)
-- --------------------------------------------------------------------------------------------------------------------------

SELECT Employee_ID, EmpFirst_Name, EmpLast_Name 
FROM Employees
WHERE EmpLast_Name REGEXP '^[FG]';

SELECT Employee_ID, EmpFirst_Name, EmpLast_Name 
FROM Employees
WHERE EmpLast_Name REGEXP BINARY '^[FG]';

-- --------------------------------------------------------------------------------------------------------------------------
-- Slide 24 & 25 (Problem & Solution)
-- --------------------------------------------------------------------------------------------------------------------------

SELECT Employee_ID, EmpFirst_Name, EmpLast_Name 
FROM Employees
WHERE EmpLast_Name REGEXP '^[^m]+$';
