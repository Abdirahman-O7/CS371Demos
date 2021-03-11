<?php
require_once 'connection.php';

$id=isset($_POST['id'])?$_POST['id']:"";
$title=isset($_POST['title'])?$_POST['title']:"";
$des=isset($_POST['des'])?$_POST['des']:"";


$SQL = "INSERT INTO Course(ID,Title,Description) VALUES(";
$SQL.="'".$id."', '".$title."', '".$des."' )";
$result = mysqli_query($connection,$SQL);

if (!$result)
    die("Insertion failed: " . mysqli_error($connection));

echo "a new course has been added successfully";

?>

