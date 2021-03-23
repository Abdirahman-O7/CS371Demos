-- --------------------------------------------------------------------------------------------------------------------------
-- Lecture 20-- Miscellaneous
-- --------------------------------------------------------------------------------------------------------------------------


-- --------------------------------------------------------------------------------------------------------------------------
-- Slides 2 & 3 (EXISTS Operator)
-- --------------------------------------------------------------------------------------------------------------------------

SELECT EXISTS (SELECT 1 FROM Transactions WHERE YEAR(TrnsDate)='2021'); -- Relationship without regard for quantity 

SELECT A.Account_ID, A.Customer_ID
FROM Accounts A
WHERE EXISTS (SELECT 1 FROM Transactions T 
WHERE T.Account_ID = A.Account_ID AND YEAR(T.TrnsDate)='2021');

-- --------------------------------------------------------------------------------------------------------------------------
-- Slides 4, 5 (Problem & Solution)
-- --------------------------------------------------------------------------------------------------------------------------
SELECT *
FROM Departments;

DELETE FROM Departments
WHERE NOT EXISTS (SELECT 1 FROM Employees WHERE Employees.Department_ID=Departments.Department_ID);

SELECT *
FROM Departments;

-- --------------------------------------------------------------------------------------------------------------------------
-- Slides 6, 7 (Conditional Logic)
-- --------------------------------------------------------------------------------------------------------------------------

SELECT * FROM Employees WHERE EmpFirst_Name LIKE '%s%'; -- Wild card without priority logic (Numerical order based on Employee_id)

SELECT * FROM Employees -- Wild card with priority logic
WHERE EmpFirst_Name LIKE '%s%'
ORDER BY
CASE
  WHEN EmpFirst_Name LIKE 's%' THEN 1
  WHEN EmpFirst_Name LIKE '%s' THEN 3
  ELSE 2
END;

-- --------------------------------------------------------------------------------------------------------------------------
-- Slides 8, 9 (Problem & Solution)
-- --------------------------------------------------------------------------------------------------------------------------

SELECT EmpFirst_Name, EmpLast_Name,EmpStart_Date,TIMESTAMPDIFF(YEAR,EmpStart_Date,CURRENT_DATE()) DIFF,
CASE
WHEN TIMESTAMPDIFF(YEAR,EmpStart_Date,CURRENT_DATE()) >=10 THEN 'Senior'
WHEN TIMESTAMPDIFF(YEAR,EmpStart_Date,CURRENT_DATE()) >=5 THEN 'Experienced'
ELSE 'Junior'
END EmpType
FROM Employees;

-- --------------------------------------------------------------------------------------------------------------------------
-- Slides 10, 11 (Problem & Solution)
-- --------------------------------------------------------------------------------------------------------------------------

SELECT C.CustFirst_Name, C.CustLast_Name, 
CASE 
WHEN EXISTS (SELECT 1  FROM Accounts A WHERE A.Customer_ID=C.Customer_ID AND A.Account_Type_ID='CHK') THEN 'Y'
ELSE 'N'
END has_checking,
CASE 
WHEN EXISTS (SELECT 1   FROM Accounts A WHERE A.Customer_ID=C.Customer_ID AND A.Account_Type_ID='SAV') THEN 'Y'
ELSE 'N'
END has_saving
FROM Customers C;
