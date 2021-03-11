<?php

require_once 'login.php';


  /* connect to the database */
$connection = mysqli_connect($db_hostname, $db_username,$db_password,$db_database);

/* if there is a problem with the connection */
if (!$connection)
    die("Unable to connect to MySQL: " . mysqli_error($connection));

//make an SQL statement and send it via the connection */
$query = "SELECT * FROM Student";
$result = mysqli_query($connection,$query);

if (!$result)
    die("Database access failed: " . mysqli_error($connection));

$html = "";

/*iterate through the result set*/
while ($row = mysqli_fetch_assoc($result)) {
    // echo "number of fields ".mysqli_num_fields($result);
    $html.="Name: " . $row['FirstName'] . "  " . $row['LastName'] . "<br>";
    $date = date_create($row['DateOfBirth']);
    $html.= "Date Of Birth: " . date_format($date, "m/d/Y") . "<br>";
    if ($row['Gender'] == 'M'){
        $html.= "Male";
        $html.="<br><br>";}
    elseif($row['Gender'] == 'F'){
        $html.= "Female";
        $html.="<br><br>";}
    elseif($row['Gender'] == 'O'){
        $html.= "Other";
    $html.="<br><br>";}
}
echo $html;

mysqli_close($connection);


?>