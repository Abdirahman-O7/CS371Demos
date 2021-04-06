<?php
include 'show_customers.php';
?>

<html>
    
<head>
    <title>Community Bank Database</title>
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
        <h2>Customer Information</h2>
        <?php echo $html ?>
    
    </div>

</body>

</html>