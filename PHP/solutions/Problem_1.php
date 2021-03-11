<!DOCTYPE html>
<html>
<body>

<?php

/* 
 write a function to join these two arrays
 * the resulting array will have these values: {"apples","bananas","dates","oranges","pineapples","mango"}
 * /
 */

$fruits_1=array('Apples','Bananas','Dates','Oranges');
$fruits_2=array('Pineapples','Mango');
$result=merge($fruits_1,$fruits_2);
$result_2=array_merge($fruits_1,$fruits_2); //another solution
print_array($result);

print_array($result_2);

function merge($array_1,$array_2){
    foreach($array_1 as $value)
        $array_3[]=$value;
    
    foreach($array_2 as $value)
        $array_3[]=$value;
    
    return $array_3;    
}

function print_array($fruits){
    foreach($fruits as $value)
        echo $value;
}
?>

</body>
</html>
