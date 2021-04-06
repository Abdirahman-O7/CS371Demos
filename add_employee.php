<?php
require_once 'connection.php';//include the connection file

$Employee_id=isset($_POST['Employee_id'])?$_POST['Employee_id']:"";
$EmpFirst_Name=isset($_POST['EmpFirst_Name'])?$_POST['EmpFirst_Name']:"";
$EmpLast_Name=isset($_POST['EmpLast_Name'])?$_POST['EmpLast_Name']:"";
$EmpStart_date=isset($_POST['EmpStart_date'])?$_POST['EmpStart_date']:"";
$EmpSupervisor_ID=isset($_POST['EmpSupervisor_ID'])?$_POST['EmpSupervisor_ID']:"";
$Department_ID=isset($_POST['Department_ID'])?$_POST['Department_ID']:"";
$Branch_ID=isset($_POST['Branch_ID'])?$_POST['Branch_ID']:"";

$SQL = "INSERT INTO employees(Employee_id,EmpFirst_Name,EmpLast_Name,EmpStart_date,EmpSupervisor_ID,Department_ID,Branch_ID) VALUES(";
$SQL.="'".$Employee_id."', '".$EmpFirst_Name."', '".$EmpLast_Name."', '".$EmpStart_date."', '".$EmpSupervisor_ID."', '".$Department_ID."', '".$Branch_ID."')";
$result = mysqli_query($connection,$SQL);

if (!$result) //if the query fails
    die("Database access failed: " . mysqli_error($connection));

    if($Employee_id !=''&& $EmpFirst_Name !='' && $EmpLast_Name !=''&& $EmpStart_date !=''&& $EmpSupervisor_ID !=''&& $Department_ID !=''&& $Branch_ID !='')
    {
    header("Location:record_added_successfully.php");
    }
