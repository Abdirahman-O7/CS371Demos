<!DOCTYPE html>
<html>
<body>

<?php


$fruits=array('Bananas', 'Apples','Dates','Oranges');
$integers=array(5,11,20,12,4);

$fruits_2=array('red'=>'Apples','yellow'=>'Bananas',
              'beige'=>'Cantaloupes','brown'=>'Dates');

sort($fruits);
echo print_array($fruits);

sort($integers, SORT_NUMERIC);
echo print_array($integers);
//echo print_associative_array($fruits_2);

function print_array($array){
    foreach($array as $value)
        echo $value." ";
}

function print_associative_array($array){
    foreach ($array as $key => $value) {
    echo "$key:$value ";
}
}
 
?>




</body>
</html>