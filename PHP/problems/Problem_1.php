<!DOCTYPE html>
<html>
<body>

<?php

/* 
 write a function to combine these two arrays into one
 * the resulting array will have these values: {"apples","bananas","dates","oranges","pineapples","mango"}
 * /
 */

$fruits_1=array('Apples','Bananas','Dates','Oranges');
$fruits_2=array('Pineapples','Mango');




function print_array($fruits){
    foreach($fruits as $value)
        echo $value;
}

?>

</body>
</html>
