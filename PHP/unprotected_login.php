<?php
  $db_hostname = 'localhost';
  $db_database = "cs490wd";
  $db_username = "root";
  $db_password = "";
  

 $connection = mysqli_connect($db_hostname, $db_username,$db_password,$db_database);
 
 if (!$connection)
    die("Unable to connect to MySQL: " . mysqli_connect_errno());
$text="";

if (isset($_POST['username']) && isset($_POST['password'])) {
    
    // $query = "SELECT * FROM Student WHERE ID='".$_POST["username"]."' AND Password='".$_POST["password"]."'"; //no injection
    $query = "SELECT * FROM Student WHERE ID='".$_POST["username"]."' OR '1=1' # AND Password='".$_POST["password"]."' OR '1=1'"; //Injection

    $result = mysqli_query($connection,$query);
    
    if (!$result)
        die("Database access failed: " . mysqli_error());

    $row_count = mysqli_num_rows($result);
    if($row_count==1)
       $text=" $row_count record was found";  
    else if($row_count>1)
        $text=" $row_count records were found"; 
    else
        $text=" No record was found"; 
}

?>

<html>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="style/style.css">
    </head>
    <body>
        <form method="post" action="unprotected_login.php">
            <table>
                <tr><td>Username:</td>
                    <td><input type="text" name="username"></td>
                </tr>
                <tr>
                    <td> Password:</td>
                    <td><input type="password" name="password"></td>
                </tr>
                <tr><td><input type="submit" value="Submit"></td></tr>
            </table>
        </form>
        <?php
        echo $text; //print the result
        ?>

    </body>
</html>

