<?php
  $db_hostname = 'localhost';
  $db_database = 'cs371spring2021';
  $db_username = 'root';
  $db_password = '';


  /* connect to the database */
$connection = mysqli_connect($db_hostname, $db_username,$db_password,$db_database);

/* if there is a problem with the connection */
if (!$connection)
    die("Unable to connect to MySQL: " . mysqli_error($connection));

?>