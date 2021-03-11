<?php
require_once 'connection.php';
include 'file_mgt.php';

$fname=isset($_POST['fname'])?$_POST['fname']:"";
$lname=isset($_POST['lname'])?$_POST['lname']:"";
$date=isset($_POST['date'])?date_create_from_format('m/d/Y', $_POST['date']):"";
$dateOfBirth=date_format($date,"Y-m-d");
$g=isset($_POST['gender'])?$_POST['gender']:"";
if ($g == 'male'){
  $g= 1;}
elseif($g == 'female'){
  $g= 2;}
elseif($g == 'other'){
  $g= 3;}
  $picture_type=get_type($_FILES['file']['name']); //this is the type of the file
  $picture=get_file($_FILES['file']["tmp_name"]);//this is where the actual file is

$SQL = "INSERT INTO Student(FirstName,LastName,DateOfBirth,Gender,Picture,Picture_Type) VALUES(";
$SQL.="'".$fname."', '".$lname."', '".$dateOfBirth."', '".$g."', '".$picture."', '".$picture_type."' )";

$result = mysqli_query($connection,$SQL);

if (!$result)
    die("Insertion failed: " . mysqli_error($connection));

echo "a new student has been added successfully";

?>