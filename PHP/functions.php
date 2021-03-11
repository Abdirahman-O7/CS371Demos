<!DOCTYPE html>
<html>
<body>
    
<?php


$integers=array(1,2,3,4,5);
$avg=average($integers);
echo $avg;

$names=array("majed","falcon","jasmin","yusif");
capitalize($names);
print_array($names);

function average($array){
    $sum=0;
    $count=0;
    
    foreach ($array as $value) {
        $count++;
        $sum+=$value;       
    }
    return $count==0?0:$sum/$count;
}

function capitalize(&$array){ //$array is passed by reference
    for ($i=0;$i<count($array);$i++) {
        $array[$i]=  ucfirst($array[$i]); 
    }  
}

function print_array($array){
    foreach ($array as $value) {
        echo $value;
        
    }
}

makeCoffee();
makeCoffee("regular");
makeCoffee("mocha","small");

function makeCoffee($type="cappuccino", $size="large"){
    echo $type." : ".$size;
}


?>

</body>
</html>