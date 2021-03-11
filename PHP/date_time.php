<!DOCTYPE html>
<html>
<body>
<?php

date_default_timezone_set('America/Chicago'); //Set the time zone to be central time

$date_1=date("M d, Y"); //ex: Oct 28, 2014
$date_2=date("l, F d, Y"); //ex: Tuesday, October 28, 2014
$date_time_1=date("l, F d, Y g:i:s A"); //ex: Tuesday, October 28, 2014 6:24:20 PM
$date_time_2=date("l, F d, Y G:i:s"); //ex: Tuesday, October 28, 2014 18:24:20  

if(checkdate(2,30,2004)) //checks if the given date (month,day,year) is valid
        echo "date is valid";
else
    echo "date is invalid ";

    $date=date_create("2013-03-15 1:30:15 PM"); //create a date object

date_add($date,date_interval_create_from_date_string("40 minutes")); //add 40 minutes to the date
echo date_format($date,"l, F d, Y G:i:s")."<br>";

date_sub($date,date_interval_create_from_date_string("40 days")); //subtract 40 days from the date
echo date_format($date,"l, F d, Y g:i:s A");

        

echo " $date_1 | ";
echo " $date_2 | ";
echo " $date_time_1 | ";
echo " $date_time_2 ";

 
?>


</body>
</html>
