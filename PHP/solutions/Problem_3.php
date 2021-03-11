<!DOCTYPE html>
<html>
<body>
<?php


$date = date_create("2020-11-16"); //Monday, Nov 16, 2020
echo create_calendar($date);

function create_calendar($date) {

    $html = "<table border='1'><tr><th width='80'></th>";
    for ($i = 0; $i < 7; $i++) { //create the header
        if ($i > 0)
            date_add($date, date_interval_create_from_date_string("1 day")); //add one day 
        $html.="<th>" . date_format($date, "l, m d, Y") . "</th>";
    }
    $html.="</tr>";

    for ($i = 0; $i < 24; $i++) { //create the hours
        $html.="<tr>";
        if ($i > 0)
            date_add($date, date_interval_create_from_date_string("1 hour")); //add one hour
        $html.="<td>". date_format($date, "g:i a") ."</td>"; //add the hh:mm pm/am format
        for ($j = 0; $j < 7; $j++) {
            $html.="<td></td>";
        }
        $html.="</tr>";
    }
    $html.="</table>";
    
    echo $html;
}

?>

</body>
</html>
