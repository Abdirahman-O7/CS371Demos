<?php


if(isset($_GET['name'])){ //does the variable $_GET['name'] exist?
    echo "Name: ".$_GET['name']."<br>";
}

if(isset($_GET['dept'])){ //does the variable $_GET['dept'] exist?
    echo "Department: ".$_GET['dept']."<br>";
}

?>