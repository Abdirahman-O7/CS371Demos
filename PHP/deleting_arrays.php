<!DOCTYPE html>
<html>
<body>

<?php


$fruits=array('Apples','Bananas','Dates','Oranges');

$fruits_2=array('red'=>'Apples','yellow'=>'Bananas',
              'beige'=>'Cantaloupes','brown'=>'Dates');

unset($fruits[2]); //delete "Dates"

unset($fruits_2['red']); //delete "Apples"


echo print_array($fruits);

function print_array($fruits){
    foreach($fruits as $value)
        echo $value;
}
 
?>



</body>
</html>