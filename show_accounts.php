<?php

require_once 'connection.php';


  /* connect to the database */
$connection = mysqli_connect($db_hostname, $db_username,$db_password,$db_database);

/* if there is a problem with the connection */
if (!$connection)
    die("Unable to connect to MySQL: " . mysqli_error($connection));

//make an SQL statement and send it via the connection */
$query = "SELECT * FROM Accounts";
$result = mysqli_query($connection,$query);

if (!$result)
    die("Database access failed: " . mysqli_error($connection));

$html = "";

/*iterate through the result set*/
while ($row = mysqli_fetch_assoc($result)) {
    // echo "number of fields ".mysqli_num_fields($result);
    $html.="Account ID: " . $row['Account_ID'] . "<br>";
    $html.="Customer ID: " . $row['Customer_ID'] . "<br>";
    $html.="Open Date: " . $row['AcctOpen_Date'] . "<br>";
    $html.="Close Date: " . $row['AcctClose_Date'] . "<br>";
    $html.="Status: " . $row['AcctStatus'] . "<br>";
    $html.="Branch ID: " . $row['Branch_ID'] . "<br>";
    $html.="Employee ID: " . $row['Employee_ID'] . "<br>";
    $html.="Type ID: " . $row['Account_Type_ID'] . "<br>";
    $html.="Available Balance: " . $row['AvailableBalance'] . "<br>";
    $html.="Last Activity: " . $row['LastActivityDate'] . "<br>";
    $html.="<br><br>";}

// echo $html;

mysqli_close($connection);


?>