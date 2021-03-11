<!DOCTYPE html>
<html>
<body>

<?php
  $mycounter = 1; //a numeric value
  $mystring  = "Hello"; // a string
  $myarray   = array("One", "Two", "Three"); // a one-dimensional array
  
  //a two-dimensional array
$shop = array(array("rose", 1.25 , 15),
    array("daisy", 0.75 , 25),
    array("orchid", 1.15 , 7) 
  ); 
  
echo $myarray[1]."<br>"; //printing the second item ("Two")
echo $shop[1][0] //accessing the word "daisy"
?>



</body>
</html>
