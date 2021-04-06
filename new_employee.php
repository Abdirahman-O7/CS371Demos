

<html>
    
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title> Community Bank Database </title>
    <link rel="stylesheet" type="text/css" href="homepage.css">
</head>

<body>

<div class="topnav">
        <a class="active" href="homepage.html">Home</a>
        <a href="employeeInformation.php">Employees</a>
        <a href="customerInformation.php">Customers</a>
        <a href="accountsInformation">Accounts</a>
        <a href="transactionInformation.php">Transactions</a>
        <a href="new_employee.php">New Employee</a>
        <a href="new_customer.php">New Customer</a>
        <a href="logout.php">Logout</a>
        
    </div>

    <div style="padding-left:16px">
        <h2>Create New Employee</h2>
        <form method="post" action="add_employee.php">
        <table>
                <tr><td>Employee ID:</td><td><input type="smallint" name="Employee_id"></td></tr>
                <tr><td>First Name:</td><td><input type="varchar" name="EmpFirst_Name"></td></tr>
                <tr><td>Last Name:</td><td><input type="varchar" name="EmpLast_Name"></td></tr>
                <tr><td>Start Date:</td><td><input type="date" name="EmpStart_date"></td></tr>
                <tr><td>End Date:</td><td><input type="date" name="EmpEnd_date"></td></tr>
                <tr><td>Supervisor ID:</td><td><input type="smallint" name="EmpSupervisor_ID"></td></tr>
                <tr><td>Department ID</td><td><input type="smallint" name="Department_ID"></td></tr>
                <tr><td>Branch ID:</td><td><input type="smallint" name="Branch_ID"></td></tr>
                <tr><td><input type="submit" value="Submit"></td><td></td>
            </table>
        </form>
    
    </div>

</body>

</html>