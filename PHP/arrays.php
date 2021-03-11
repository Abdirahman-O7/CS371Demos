<!DOCTYPE html>
<html>
<body>

<?php


$fruits=array('Apples','Bananas','Dates','Oranges');

/* this is the same as $fruits*/
$fruits_2[0]='Apples';
$fruits_2[1]='Bananas';
$fruits_2[2]='Dates';
$fruits_2[3]='Oranges';

/* this is the same as $fruits as well*/
$fruits_3[]='Apples';
$fruits_3[]='Bananas';
$fruits_3[]='Dates';
$fruits_3[]='Oranges';


foreach ($fruits as $value) {
    echo $value;
}

for($i=0;$i<count($fruits);$i++){
    echo $fruits[$i];
}
 
 
?>


</body>
</html>