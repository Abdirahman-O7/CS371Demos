

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
        <h2>Create New Customer</h2>
        <form method="post" action="add_customer.php">
        <table>
                <tr><td>Customer ID: </td><td><input type="int" name="Customer_ID"></td></tr>
                <tr><td>First Name: </td><td><input type="varchar" name="CustFirst_Name"></td></tr>
                <tr><td>Last Name: </td><td><input type="varchar" name="CustLast_Name"></td></tr>
                <tr><td>Birthday: </td><td><input type="date" name="CustBirth_Date"></td></tr>
                <tr><td>Street: </td><td><input type="varchar" name="CustStreet"></td></tr>
                <tr><td>City: </td><td><input type="varchar" name="CustCity"></td></tr>
                <tr><td>State: </td><td><input type="varchar" name="State_ID"></td></tr>
                <tr><td>Zip: </td><td><input type="varchar" name="CustZip_code"></td></tr>
                <tr><td><input type="submit" value="Submit"></td><td></td>
            </table>
        </form>
    
    </div>

</body>

</html>