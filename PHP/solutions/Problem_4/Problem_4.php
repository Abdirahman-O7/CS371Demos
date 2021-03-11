<?php

require_once 'login.php';


  /* connect to the database */
$connection = mysqli_connect($db_hostname, $db_username,$db_password,$db_database);

/* if there is a problem with the connection */
if (!$connection)
    die("Unable to connect to MySQL: " . mysqli_error($connection));

//make an SQL statement and send it via the connection */
$query = "SELECT * FROM Course";
$result = mysqli_query($connection,$query);

if (!$result)
    die("Database access failed: " . mysqli_error($connection));

$row_count = mysqli_num_rows($result); //get the number of rows

$html = "<table border='1'><tr><th>ID</th><th>Title</th><th>Description</th></tr>";

for ($j = 0; $j < $row_count; ++$j) {
    $row = mysqli_fetch_array($result); //fetch the next row
    $html.="<tr><td>".$row["ID"]."</td><td>".$row["Title"]."</td><td>".$row["Description"]."</td></tr>";
}
echo $html;

mysqli_close($connection);



