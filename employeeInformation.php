<?php
include 'show_employees.php';
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
    </div>


    <div style="padding-left:16px">
        <h2>Employee Information</h2>
        <?php echo $html ?>
    
    </div>

</body>

</html>