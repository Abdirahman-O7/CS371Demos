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
-- Slide 11 (Membership Condition)
-- --------------------------------------------------------------------------------------------------------------------------

