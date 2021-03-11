<?php

require_once 'connection.php';



if(isset($_POST["options"]) && $_POST["options"]!=""){
    $sql="";
    $type=$_POST["options"]; //we get the type of an operation from a hidden input
    $id=$_POST["id"];
    $des=$_POST["des"];
    $title=$_POST["title"];
    if($type=="edit"){
        $sql="UPDATE Course SET Title='$title', Description='$des' WHERE ID='$id'";        
    }
    else if($type=="delete"){
        $sql="DELETE FROM Course WHERE ID='$id'";
    }
   

$result = mysqli_query($connection,$sql);

if (!$result)
    die("Database access failed: " . mysqli_error($connection));
}

$query = "SELECT * FROM Course";
$result = mysqli_query($connection,$query);

if (!$result)
    die("Database access failed: " . mysqli_error($connection));

$row_count = mysqli_num_rows($result);
$courses = "";

for ($j = 0; $j < $row_count; ++$j) {
    
    $row = mysqli_fetch_array($result); //fetch the next row
    
    $courses.="<div class='box'>";
    $courses.="<form method='post' action='show_courses.php'>";
    $courses.="<table>";
    $courses.="<tr><td> </td><td><select data-course-ID='".$row["ID"]."' name='options' class='actions'><option value=''> Actions </option><option value='edit'>Edit</option><option value='delete'>Delete</option></select></td></tr>";
    $courses.="<tr><td> <div class='name'>ID:</div> </td><td><input name='id' readonly='false' class='uneditable' type='text' value='".$row["ID"]."'> </td></tr>";
    $courses.="<tr><td> <div class='name'>Title:</div> </td><td><input id='title_".$row["ID"]."' name='title' readonly='true' class='uneditable' type='text' value='".$row["Title"]."'> </td></tr>";
    $courses.="<tr><td> <div class='name'>Description:</div> </td><td><textarea id='description_".$row["ID"]."' name='des' readonly='true' rows='4' cols='40' class='uneditable'>".$row["Description"]."</textarea> </td></tr>";
    $courses.="<tr id='row_".$row["ID"]."' class='hidden'><td></td><td> <input id='submit_".$row["ID"]."'  type='submit' value='submit'></td></tr>";
    $courses.="</table>";
    $courses.="</form>";
    $courses.="</div>";
}
mysqli_close($connection);

?>