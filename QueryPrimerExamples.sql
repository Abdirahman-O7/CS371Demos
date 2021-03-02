-- Query Primer Lecture Examples

-- --------------------------------------------------------------------------------------------------------------------------
-- Slide 3 (Result set: Table containing rows and columns)
-- --------------------------------------------------------------------------------------------------------------------------

SELECT Employee_ID, EmpFirst_Name, EmpLast_Name 
FROM Employees;

-- --------------------------------------------------------------------------------------------------------------------------
-- Slides 5-8 (SELECT clause: "Show me...")
-- --------------------------------------------------------------------------------------------------------------------------

SELECT *
FROM Departments;

SELECT Department_ID, DeptName -- Displays same result set as above
FROM Departments;

SELECT DeptName
FROM Departments;

SELECT Employee_ID,'ACTIVE', -- Uses built-in functions
Employee_ID*3.14159,UPPER(EmpLast_Name)
FROM Employees;

SELECT VERSION(), USER(), DATABASE();

-- --------------------------------------------------------------------------------------------------------------------------
-- Slides 9 & 10 (Column Aliases)
-- --------------------------------------------------------------------------------------------------------------------------

SELECT Employee_ID, 'ACTIVE' Status, Employee_ID*3.14159 Employee_ID_X_PI, UPPER(EmpLast_Name) Last_Name_Upper -- Same result as above, column aliases added for Employee_ID and EmpLast_Name
FROM Employees;

SELECT Employee_ID, 'ACTIVE' AS Status, Employee_ID*3.14159 AS Employee_ID_X_PI, UPPER(EmpLast_Name) AS Last_Name_Upper -- Same result as above-- readability of query improved
FROM Employees;

-- --------------------------------------------------------------------------------------------------------------------------
-- Slide 11 (Removing Duplicates)
-- --------------------------------------------------------------------------------------------------------------------------

SELECT Customer_ID -- Features Customer_ID duplicates
FROM Accounts;

SELECT DISTINCT Customer_ID -- Shows unique Customer_IDs
FROM Accounts;

-- --------------------------------------------------------------------------------------------------------------------------
-- Slide 12 (Limit Operator)
-- --------------------------------------------------------------------------------------------------------------------------

SELECT * FROM Employees -- Displays first 4 employees
LIMIT 4;

SELECT * FROM Employees -- Displays employees 3, 4 and 5
LIMIT 2,3; -- First number is the offset, second number is the rows to display

-- --------------------------------------------------------------------------------------------------------------------------
-- Slides 13 & 14 (WHERE Clause)
-- --------------------------------------------------------------------------------------------------------------------------

SELECT Employee_ID, EmpFirst_Name, EmpLast_Name,EmpStart_Date, Department_ID -- Filtering employees in Department_ID = 1
FROM Employees
WHERE Department_ID=1;

SELECT Employee_ID, EmpFirst_Name, EmpLast_Name,EmpStart_Date, Department_ID -- Filtering employees in Department_ID = 1 and a start date after 1.1.2002
FROM Employees
WHERE Department_ID=1 AND EmpStart_Date >'2002-01-01';

-- --------------------------------------------------------------------------------------------------------------------------
-- Slides 15 & 16 (Problem/Solution)
-- --------------------------------------------------------------------------------------------------------------------------

SELECT CONCAT(EmpFirst_Name,"  ",EmpLast_Name) Employee_Name, YEAR(EmpStart_Date) Work_Year -- Could use "AS"
FROM Employees
WHERE YEAR(EmpStart_Date)=2002;

-- --------------------------------------------------------------------------------------------------------------------------
-- Slide 17 (GROUP BY Clause) (//Aggregates)
-- --------------------------------------------------------------------------------------------------------------------------

SELECT Department_ID, Count(Employee_ID) Num_Employees
FROM Employees
GROUP BY Department_ID
HAVING Count(Employee_ID)>2; -- Optional for filtering purposes

-- --------------------------------------------------------------------------------------------------------------------------
-- Slides 19 & 20 (Problem/Solution)
-- --------------------------------------------------------------------------------------------------------------------------

SELECT Count(Employee_ID) Num_Employees,YEAR(EmpStart_Date) Work_Year
FROM Employees
GROUP BY Work_Year
HAVING Work_Year<2004;

-- --------------------------------------------------------------------------------------------------------------------------
-- Slide 21 (ORDER BY Clause)
-- --------------------------------------------------------------------------------------------------------------------------

SELECT EmpFirst_Name,EmpLast_Name
FROM Employees
ORDER BY EmpLast_Name, EmpFirst_Name; -- Alphabetized based on last name, then first name

SELECT EmpFirst_Name,EmpLast_Name
FROM Employees
ORDER BY EmpLast_Name DESC, EmpFirst_Name; -- Reverse-alphabetized based on last name, then first name (alphabetized)

-- --------------------------------------------------------------------------------------------------------------------------
-- Slides 22 & 23 (Problem/Solution)
-- --------------------------------------------------------------------------------------------------------------------------

-- Must be in this order
SELECT Count(Employee_ID) Num_Employees,YEAR(EmpStart_Date) Work_Year
FROM Employees
GROUP BY Work_Year
HAVING Work_Year<2004
ORDER BY Num_Employees DESC;

-- --------------------------------------------------------------------------------------------------------------------------
-- Slide 24 (Creating Views)
-- --------------------------------------------------------------------------------------------------------------------------

CREATE VIEW Employees_View AS
SELECT Employee_ID, EmpFirst_Name,EmpLast_Name,YEAR(EmpStart_Date) Start_Year
FROM Employees;

SELECT Employee_ID,Start_Year
FROM Employees_View;

DROP VIEW Employees_View; -- Deletes view

-- --------------------------------------------------------------------------------------------------------------------------
-- Slide 25 (Subqueries)
-- --------------------------------------------------------------------------------------------------------------------------

SELECT E.Employee_ID, E.FName,E.LName -- Inner SELECT statement executed first
FROM 
(SELECT Employee_ID, EmpFirst_Name FName, EmpLast_Name Lname, EmpStart_Date 
FROM Employees WHERE Department_ID=1) E; -- Subquery alias: E

-- --------------------------------------------------------------------------------------------------------------------------
-- Slides 26 & 27 (Problem/Solution)
-- --------------------------------------------------------------------------------------------------------------------------

SELECT Transaction_ID,TrnsType,TrnsAmount,TrnsDate
FROM Transactions
WHERE TrnsAmount > (SELECT AVG(TrnsAmount) FROM Transactions) -- subquery finds average, external query finds greater than the average
