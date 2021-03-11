<!DOCTYPE html>
<html>
<body>

<?php

$a=5;
$b=10;

//one if statement
if($a<$b){
    echo "a is less than b";
}

//if-else statement

if($a<$b){
    echo "a is less than b";
}
else{
    echo "a is not less than b";
}

$result= $a<$b? "a is less than b" : "a is not less than b";
echo $result;

//if else-if else statement
if($a<$b){
    echo "a is less than b";
}
else if($a>$b){
    echo "a is greater than b";
}
else{
    echo "a is equal to b";
}


 
?>

</body>
</html>