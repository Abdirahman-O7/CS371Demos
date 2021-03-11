<?php
include 'search.php';
?>

<html>
    <head>
   <title>View a Student</title>
        <meta charset="UTF-8">
         <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <form method="post" action="search_student.php">
            <input type="text" name="search"><select name="gender"><option value="">Gender</option><option value="M">Male</option><option value="F">Female</option></select><input type="submit" value="Search">
        </form>
    <?php
    echo $student;
    ?>  
    </body>
</html>