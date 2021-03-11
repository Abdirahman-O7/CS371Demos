
<?php

//establish the connection
require_once 'connection.php';


//select all the students and send the SQL statement
$query = "SELECT * FROM student";
$result = mysqli_query($connection,$query);

if (!$result)
    die("Database access failed: " . mysqli_error($connection));

$row_count = mysqli_num_rows($result);
$students = ""; //holds the HTML that represents a student


for ($j = 0; $j < $row_count; ++$j) {
    
    $row = mysqli_fetch_array($result); //fetch the next row
    
    $students.="<div class='box'>";
    $students.='<img src="data:' . $row["Picture_Type"] . ';base64,' . base64_encode($row["Picture"]) . '">';
    $students.="<div class='name'>".$row["FirstName"]." ".$row["LastName"]."</div>";
    $students.="<table>";
    if ($row['Gender'] == 'M'){
        $gender= "Male";}
    elseif($row['Gender'] == 'F'){
        $gender= "Female";}
    elseif($row['Gender'] == 'O'){
        $gender= "Other";}
    $students.="<tr><td class='name'> Gender: </td><td class='value'>".$gender."</td></tr>";
    $age = date_diff(date_create($row["DateOfBirth"]), date_create('now'))->y; //calculate $age based using date_diff (date difference)
    $students.="<tr><td class='name'> Age: </td><td class='value'>".$age."</td></tr>";
    $students.="</table>";
    $students.="</div>";
}
mysqli_close($connection);

?>
