<?php
require_once 'connection.php';//include the connection file

$Customer_ID=isset($_POST['Customer_ID'])?$_POST['Customer_ID']:"";
$CustFirst_Name=isset($_POST['CustFirst_Name'])?$_POST['CustFirst_Name']:"";
$CustLast_Name=isset($_POST['CustLast_Name'])?$_POST['CustLast_Name']:"";
$CustBirth_Date=isset($_POST['CustBirth_Date'])?$_POST['CustBirth_Date']:"";
$CustStreet=isset($_POST['CustStreet'])?$_POST['CustStreet']:"";
$CustCity=isset($_POST['CustCity'])?$_POST['CustCity']:"";
$State_ID=isset($_POST['State_ID'])?$_POST['State_ID']:"";
$CustZip_code=isset($_POST['CustZip_code'])?$_POST['CustZip_code']:"";

$SQL = "INSERT INTO customers(Customer_ID,CustFirst_Name,CustLast_Name,CustBirth_Date,CustStreet,CustCity,State_ID,CustZip_code) VALUES(";
$SQL.="'".$Customer_ID."', '".$CustFirst_Name."', '".$CustLast_Name."', '".$CustBirth_Date."', '".$CustStreet."', '".$CustCity."', '".$State_ID."', '".$CustZip_code."')";
$result = mysqli_query($connection,$SQL);

if (!$result) //if the query fails
    die("Database access failed: " . mysqli_error($connection));

    if($Customer_ID !=''&& $CustFirst_Name !='' && $CustLast_Name !=''&& $CustBirth_Date !=''&& $CustStreet !=''&& $CustCity !=''&& $State_ID !=''&& $CustZip_code !='')
    {
    header("Location:record_added_successfully.php");
    }
