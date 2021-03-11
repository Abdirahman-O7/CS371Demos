<!DOCTYPE html>
<html>
<body>

<?php


$fruits=array('red'=>'Apples','yellow'=>'Bananas',
              'beige'=>'Cantaloupes','brown'=>'Dates');

$var=$fruits['red']; //the value is ‘Apples’

//iterating through the array

foreach ($fruits as $key => $value) {
    echo "$key:$value";
}

//an alternative way for iterating through the array
// while(list($key,$value)=each($fruits)){
//      echo "$key:$value";
     
// }
 
?>


</body>
</html>