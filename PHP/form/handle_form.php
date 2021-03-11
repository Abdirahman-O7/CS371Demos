<?php

if(isset($_POST['name']))
    $name=$_POST['name'];
else
    $name="Not entered";

if(isset($_POST['dept']))
    $dept=$_POST['dept'];
else
    $dept="Not entered";

echo "Name: $name <br>";
echo "Department: $dept";
?>