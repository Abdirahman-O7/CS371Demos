<?php

require_once 'login.php';

if(isset($_GET['ID'])){ //if an ID variable is passed in the URL
    $connection = mysqli_connect($db_hostname, $db_username,$db_password,$db_database);

if (!$connection)
    die("Unable to connect to MySQL: " . mysqli_error($connection));


$query = "SELECT * FROM Course WHERE ID='".$_GET['ID']."'";


$result = mysqli_query($connection,$query);

if (!$result)
    die("Database access failed: " . mysqli_error($connection));

$row_count = mysqli_num_rows($result);
$html = "";

for ($j = 0; $j < $row_count; ++$j) {
    $row = mysqli_fetch_array($result); //fetch the next row
    $html.="ID: " . $row['ID']. "<br>";
    $html.="Title: " . $row['Title']. "<br>";
    $html.="Description: " . $row['Description']. "<br>";
}
echo $html;

mysqli_close($connection);
    
}