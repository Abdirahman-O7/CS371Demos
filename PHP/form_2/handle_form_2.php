<?php

if(isset($_POST['name']))
    $name=$_POST['name'];

if(isset($_POST['email']))
    $email=$_POST['email'];

if(isset($_POST['dept']))
    $dept=$_POST['dept'];

if(isset($_POST['gender']))
    $gender=$_POST['gender'];

if(isset($_POST['contact']))
    $contact=$_POST['contact'];

echo "Name : $name <br> Email: $email <br> Department: $dept <br> Gender: $gender <br>";
echo "Contact: ";
for($i=0;$i<count($contact);$i++){
    echo $contact[$i]."  ";
}

?>