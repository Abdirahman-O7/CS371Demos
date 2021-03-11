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
            <input type="text" name="search"><input type="submit" value="Search">
        </form>
    <?php
    echo $student;
    ?>  
    </body>
</html>