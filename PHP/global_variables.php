<!DOCTYPE html>
<html>
<body>
<?php

$a = 15; 
$GLOBALS['b'] = 10;
 
function add() { 
  $GLOBALS['c'] = $GLOBALS['a'] + $GLOBALS['b']; 
}
 
add(); 
echo $c; 

?>
</body>
</html>
