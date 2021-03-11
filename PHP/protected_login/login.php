<?php
include "connection.php";
include "sanitization.php";
$text="";
$salt='web';

if (isset($_POST['username']) && isset($_POST['password'])) {
    $username = sanitizeMYSQL($connection,$_POST['username']);
    $password=md5($salt.sanitizeMYSQL($connection,$_POST['password']).$salt);
    
    $query = "SELECT * FROM Student WHERE ID='".$username."' AND Password='".$password."'";
    $result = mysqli_query($connection,$query);
    
    if (!$result)
        $text=" No record was found";
    else{
        $row_count = mysqli_num_rows($result);
    if($row_count>=1)
       $text=" $row_count record was found";  
    else
        $text=" No record was found"; 
    }
}

?>

<html>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="style/style.css">
    </head>
    <body>
        <form method="post" action="login.php">
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