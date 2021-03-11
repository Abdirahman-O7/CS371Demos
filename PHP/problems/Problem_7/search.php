<?php

require_once 'connection.php';
$student = ""; //HTML for the students

    $data = $_POST['search'];
    $query = "SELECT * FROM Student WHERE FirstName LIKE '%$data%' OR LastName LIKE '%$data%'";
    $result = mysqli_query($connection, $query);

    if (!$result)
        die("Database access failed: " . mysqli_error($connection));

    $row_count = mysqli_num_rows($result);


    for ($j = 0; $j < $row_count; ++$j) {

        $row = mysqli_fetch_array($result); //fetch the next row
        $student.=display_student($row);
    }
    mysqli_close($connection);


//make HTML for a student
    function display_student($row) {
        $student = "<div class='box'>";
        $student.='<img src="data:' . $row["Picture_Type"] . ';base64,' . base64_encode($row["Picture"]) . '">';
        $student.="<div class='name'>" . $row["FirstName"] . " " . $row["LastName"] . "</div>";
        $student.="<table>";
        if ($row['Gender'] == 'M'){
            $html.= "Male";
            $html.="<br><br>";}
        elseif($row['Gender'] == 'F'){
            $html.= "Female";
            $html.="<br><br>";}
        elseif($row['Gender'] == 'O'){
            $html.= "Other";
        $student.="<tr><td class='name'> Gender: </td><td class='value'>" . $gender . "</td></tr>";
        $age = date_diff(date_create($row["DateOfBirth"]), date_create('now'))->y; //calculate $age based using date_diff (date difference)
        $student.="<tr><td class='name'> Age: </td><td class='value'>" . $age . "</td></tr>";
        $student.="</table>";
        $student.="</div>";
        return $student;
    }

?>
