-- --------------------------------------------------------------------------------------------------------------------------
-- Slide 3 (Cartesian Product)
-- --------------------------------------------------------------------------------------------------------------------------

SELECT E.EmpFirst_Name,E.EmpLast_Name, D.DeptName -- Every permutation
FROM Employees E
JOIN Departments D;

-- --------------------------------------------------------------------------------------------------------------------------
-- Slide 4 & 5 (INNER JOIN)
-- --------------------------------------------------------------------------------------------------------------------------

SELECT EmpFirst_Name,EmpLast_Name, DeptName -- Default: INNER JOIN
FROM Employees
JOIN Departments
ON Employees.Department_ID=Departments.Department_ID;

SELECT EmpFirst_Name,EmpLast_Name, DeptName -- Explicitly INNER JOIN
FROM Employees
INNER JOIN Departments
ON Employees.Department_ID=Departments.Department_ID;

SELECT EmpFirst_Name,EmpLast_Name, DeptName -- Shorthand if linking keys are same
FROM Employees
INNER JOIN Departments
USING (Department_ID);

-- --------------------------------------------------------------------------------------------------------------------------
-- Slide 6 (NATURAL JOIN) NOT recommended
-- --------------------------------------------------------------------------------------------------------------------------

SELECT EmpFirst_Name,EmpLast_Name, DeptName -- Good example
FROM Employees
NATURAL JOIN Departments;


SELECT EmpFirst_Name,EmpLast_Name, CustFirst_Name, CustLast_Name -- Bad example
FROM Employees
NATURAL JOIN Customers;

-- --------------------------------------------------------------------------------------------------------------------------
-- Slide 7 & 8 (Problem & Solution)
-- --------------------------------------------------------------------------------------------------------------------------

SELECT C.CustFirst_Name,C.CustLast_Name,A.Account_ID,A.Account_Type_ID
FROM Customers C
INNER JOIN Accounts A
ON C.Customer_ID=A.Customer_ID
WHERE A.Account_Type_ID='CHK';

-- --------------------------------------------------------------------------------------------------------------------------
-- Slide 9 & 10 (Problem & Solution)
-- --------------------------------------------------------------------------------------------------------------------------

SELECT E.EmpFirst_Name FName,E.EmpLast_Name LName,S.EmpFirst_Name Supervisor_FName,S.EmpLast_Name Supervisor_LName
FROM Employees E
INNER JOIN Employees S
ON E.EmpSupervisor_ID=S.Employee_ID;

-- --------------------------------------------------------------------------------------------------------------------------
-- Slide 11 & 12 (Problem & Solution)
-- --------------------------------------------------------------------------------------------------------------------------

SELECT COUNT(E.Employee_id) Employee_Count,S.EmpLast_Name Supervisor_LName
FROM Employees E
INNER JOIN Employees S
ON E.EmpSupervisor_ID=S.Employee_ID
GROUP BY E.EmpSupervisor_ID;

-- --------------------------------------------------------------------------------------------------------------------------
-- Slide 13 (Joining 3+ Tables)
-- --------------------------------------------------------------------------------------------------------------------------

SELECT C.CustFirst_Name,C.CustLast_Name,A.Account_ID,A_T.Account_Type_Name
FROM Customers C
INNER JOIN Accounts A
ON C.Customer_ID=A.Customer_ID
INNER JOIN Account_Types A_T
ON A_T.Account_Type_ID=A.Account_Type_ID
WHERE A_T.Account_Type_Name='savings account';

-- --------------------------------------------------------------------------------------------------------------------------
-- Slide 16 (Types of JOIN)
-- --------------------------------------------------------------------------------------------------------------------------

SELECT * -- NULL on right side when no match
FROM Customers -- Left table
LEFT OUTER JOIN Accounts -- Right table
ON Customers.Customer_ID=Accounts.Customer_ID;

SELECT *  -- Combines matching rows
FROM Customers
INNER JOIN Accounts
ON Customers.Customer_ID=Accounts.Customer_ID;

SELECT * -- NULL on left side when no match
FROM Customers -- Left table
RIGHT OUTER JOIN Accounts -- Right table
ON Customers.Customer_ID=Accounts.Customer_ID;

-- --------------------------------------------------------------------------------------------------------------------------
-- Slide 18 (Problem & Solution)
-- --------------------------------------------------------------------------------------------------------------------------

SELECT * -- Combines matching rows
FROM Customers -- Left table
INNER JOIN Accounts -- Right table
ON Customers.Customer_ID=Accounts.Customer_ID;

SELECT * -- AKA left outer join
FROM Customers -- Left table
LEFT JOIN Accounts -- Right table
ON Customers.Customer_ID=Accounts.Customer_ID;

SELECT * -- Shows results found in left table ONLY
FROM Customers -- Left table
LEFT JOIN Accounts -- Right table
ON Customers.Customer_ID=Accounts.Customer_ID
WHERE Accounts.Customer_ID 	IS NULL;

-- --------------------------------------------------------------------------------------------------------------------------
-- Slide 19 (Problem & Solution)
-- --------------------------------------------------------------------------------------------------------------------------

SELECT * -- AKA right outer join
FROM Customers -- Left table
RIGHT JOIN Accounts -- Right table
ON Customers.Customer_ID=Accounts.Customer_ID;

SELECT * -- Shows results found in right table ONLY
FROM Customers -- Left table
RIGHT JOIN Accounts -- Right table
ON Customers.Customer_ID=Accounts.Customer_ID
WHERE Customers.Customer_ID IS NULL;

-- --------------------------------------------------------------------------------------------------------------------------
-- Slide 20 (Problem & Solution)
-- --------------------------------------------------------------------------------------------------------------------------

SELECT * -- Emulates FULL OUTER JOIN
FROM Customers
LEFT JOIN Accounts
ON Customers.Customer_ID=Accounts.Customer_ID
UNION
SELECT * 
FROM Customers
RIGHT JOIN Accounts
ON Customers.Customer_ID=Accounts.Customer_ID;

SELECT * -- Emulates FULL OUTER JOIN without overlap
FROM Customers
LEFT JOIN Accounts
ON Customers.Customer_ID=Accounts.Customer_ID
UNION
SELECT * 
FROM Customers
RIGHT JOIN Accounts
ON Customers.Customer_ID=Accounts.Customer_ID
WHERE Customers.Customer_ID IS NULL OR Accounts.Customer_ID IS NULL;

-- --------------------------------------------------------------------------------------------------------------------------
-- Slide 21 & 22 (Problem & Solution)
-- --------------------------------------------------------------------------------------------------------------------------

SELECT A.Account_ID, COUNT(T.TrnsAmount) NUM_Transactions
FROM Accounts A
LEFT JOIN Transactions T
ON T.Account_ID=A.Account_ID
GROUP BY A.Account_ID;

-- --------------------------------------------------------------------------------------------------------------------------
-- Slides 24 & 25 (UNION Operator)
-- --------------------------------------------------------------------------------------------------------------------------

SELECT EmpFirst_Name First_Name, EmpLast_Name Last_Name, 'Employee' Person_Type -- Does not remove duplicates
FROM Employees
UNION ALL
SELECT CustFirst_Name First_Name,CustLast_Name Last_Name, 'Customer' Person_Type
FROM Customers
ORDER BY Last_Name,First_Name;

SELECT EmpFirst_Name First_Name, EmpLast_Name Last_Name -- Removes duplicates
FROM Employees
UNION 
SELECT CustFirst_Name First_Name,CustLast_Name Last_Name
FROM Customers
ORDER BY Last_Name,First_Name;

-- --------------------------------------------------------------------------------------------------------------------------
-- Slide 26 (INTERSECT Operator)
-- --------------------------------------------------------------------------------------------------------------------------

SELECT EmpFirst_Name First_Name, EmpLast_Name Last_Name -- Alternatitve to INTERSECT operator
FROM Employees E
INNER JOIN Customers C
ON E.EmpFirst_Name=C.CustFirst_Name AND E.EmpLast_Name=C.CustLast_Name;

-- --------------------------------------------------------------------------------------------------------------------------
-- Slide 27 (EXCEPT Operator)
-- --------------------------------------------------------------------------------------------------------------------------

SELECT EmpFirst_Name First_Name, EmpLast_Name Last_Name
FROM Employees E
LEFT JOIN Customers C
ON E.EmpFirst_Name=C.CustFirst_Name AND E.EmpLast_Name=C.CustLast_Name
WHERE C.CustFirst_Name IS NULL AND C.CustLast_Name IS NULL;

-- --------------------------------------------------------------------------------------------------------------------------
-- Slide 29 & 30 (Problem & Solution)
-- --------------------------------------------------------------------------------------------------------------------------

SELECT CustFirst_Name First_Name,CustLast_Name Last_Name
FROM Customers
WHERE State_ID='MA'

UNION

SELECT EmpFirst_Name,EmpLast_Name
FROM Employees
INNER JOIN Branches
WHERE State_ID='MA'

-- --------------------------------------------------------------------------------------------------------------------------
-- Slide 31 & 32 (Problem & Solution)
-- --------------------------------------------------------------------------------------------------------------------------
