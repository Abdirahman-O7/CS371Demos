<!DOCTYPE html>
<html>
<body>
<?php

/* 
 write a function to convert this array into a string, the words are sperated by commas
 * /
 */

$fruits_1=array('Apples','Bananas','Dates','Oranges');
echo array_to_string($fruits_1, ",");

echo join(",",$fruits_1); //another solution


function array_to_string($array,$delimiter){
    $string="";
    
    $index=0;
    foreach($array as $value){
        if($index>0)
            $string.=$delimiter;
        $string.=$value;
        
        $index++;
    }
    return $string;
}

?>


</body>
</html>
