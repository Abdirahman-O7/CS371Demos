<?php
include "connection.php";
include "sanitization.php";

$str = "A 'quote' is <b>bold</b>";

// Outputs: A 'quote' is &lt;b&gt;bold&lt;/b&gt;
echo htmlentities('&lt;');


echo strip_tags('<b>');


$text_1="<b>bold</b>";

echo sanitizeString($text_1);

$username="1' OR '1'='1' #"; //SQL injection
$username=mysqli_real_escape_string($connection,$username);
$password="1";
$password=mysqli_real_escape_string($connection,$password);
$query="SELECT * FROM WHERE ID='$username' AND Password='$password' ";
echo  $query; 

//SELECT * FROM WHERE ID='1\' OR \'1\'=\'1\' #' AND Password='1'

$result = mysqli_query($connection,$query);
    
    if (!$result)
        die("Database access failed: " . mysqli_error($connection));

    $row_count = mysqli_num_rows($result);
    if($row_count==1)
       $text=" $row_count record was found";  
    else if($row_count>1)
        $text=" $row_count records were found"; 
    else
        $text=" No record was found"; 