<!DOCTYPE html>
<html>
<body>

<?php


$fruits=array('Apples','Bananas','Dates','Oranges');

$fruits_2=array('red'=>'Apples','yellow'=>'Bananas',
              'beige'=>'Cantaloupes','brown'=>'Dates');

$fruits[]='Kiwi'; //add Kiwi to the end of $fruits


$fruits_2['lightbrown']='Kiwi'; //add the entry ‘lightbrown: Kiwi’


echo print_array($fruits);

echo print_associative_array($fruits_2);

function print_array($array){
    foreach($array as $value)
        echo $value;
}

function print_associative_array($array){
    foreach ($array as $key => $value) {
    echo "$key:$value";
}
}
 
?>



</body>
</html>