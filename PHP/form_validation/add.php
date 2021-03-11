<?php
require_once 'connection.php';
include 'file_mgt.php';
include "sanitization.php";


$valid = false; //initially so that we show the form, or when the form has been submitted and is invalid
$password_error = ""; //error message for password
$fname_error = ""; //error message for first name
$lname_error = ""; //error message for last name
$gender_error = ""; //error message for gender
$insertion_error = ""; //error message for insertion in general
$date_error = ""; //error message for date
$id="";
$password="";
$fname="";
$lname="";
$date="";

if(isset($_POST['password'])){
    $password = isset($_POST['password']) ? sanitizeMYSQL($connection,$_POST['password']) : "";
    $password_error = validate_password($password);
    $salt="web";
    $encoded_password=md5($salt.$password.$salt);

    $fname = isset($_POST['fname']) ? sanitizeMYSQL($connection,$_POST['fname']) : "";
    $fname_error = validate_name($fname, "First name");
    $lname = isset($_POST['lname']) ? sanitizeMYSQL($connection,$_POST['lname']) : "";
    $lname_error = validate_name($lname, "Last name");
    $date = isset($_POST['date']) ? sanitizeMYSQL($connection,$_POST['date']) : "";
    $date_error = validate_date($date);
    $dateOfBirth="";
    if ($date_error == "") //if date is valid
        $dateOfBirth = date_format(date_create_from_format('m/d/Y', $date), "Y-m-d");
    $g = isset($_POST['gender']) ? sanitizeMYSQL($connection,$_POST['gender']) : "";
    $gender_error=  validate_gender($g);
    // $gender = $g == "male" ? 1 :("female" ? 2 :("other"));
    if ($g == 'male'){
        $gender= 1;}
    elseif($g == 'female'){
        $gender= 2;}
    elseif($g == 'other'){
        $gender= 3;}
    $picture_type = get_type($_FILES['file']['name']); //this is the type of the file
    $picture = get_file($_FILES['file']["tmp_name"]); //this is where the actual file is

    $valid = $id_error == "" && $password_error == "" && $fname_error == "" && $lname_error == "" && $gender_error == "" && $date_error == "";
    if ($valid) {
        $SQL = "INSERT INTO Student(FirstName,LastName,DateOfBirth,Gender,Picture,Picture_Type,Password) VALUES(";
        $SQL.="'" . $fname . "', '" . $lname . "', '" . $dateOfBirth . "', '" . $gender . "', '" . $picture . "', '" . $picture_type . "' , '".$encoded_password."' )";

        $result = mysqli_query($connection,$SQL);

        if (!$result) {
            $valid = false;
            $insertion_error = " The student couldn't be inserted. Try again later";
        }
    }
}


function validate_date($date) {
    if (trim($date) == "")
        return "Date is required";
    $date_object = date_create_from_format('m/d/Y', $date);
    if (!checkdate(date_format($date_object, "m"), date_format($date_object, "d"), date_format($date_object, "Y")))
        return "Date is invalid";
    return ""; //date is valid
}

function validate_gender($gender) {
    if (trim($gender) == "")
        return "Gender is required";
    if ($gender != "male" && $gender != "female" && $gender != "other")
        return "Gender is not specified correctly";
    return ""; //gender is valid
}

function validate_name($name, $field_name) {
    if (trim($name) == "")
        return "$field_name is required";
    if (preg_match('/\d/', $name))
        return "$field_name must not contain digits";
    if (strlen($name) < 2 || strlen($name) > 150)
        return "The length of $field_name must be >=1 and <=150";
}


function validate_password($password) {
    if (trim($password) == "")
        return "Password is required";
    $message = "";
    $contains_digits = preg_match('/\d/', $password);
    $contains_lowercase = preg_match('/[a-z]/', $password);
    $contains_uppercase = preg_match('/[A-Z]/', $password);

    if (!$contains_digits || !$contains_lowercase || !$contains_uppercase) {
        $message = "Password must contain: ";

        if (!$contains_digits)
            $message.="digits |";

        if (!$contains_lowercase)
            $message.=" lowercase letters |";

        if (!$contains_uppercase)
            $message.=" uppercase letters |";

        return $message;
    }
    if (strlen($password) < 8 || strlen($password) > 10)
        return "Password must be >=8 and <=10";
    return ""; //valid
}
?>

<html>
    <head>
        <title>Add Student</title>
        <meta charset="UTF-8">
        <style>
            .error{
                color:red;
            }
        </style>
    </head>
    <body>

        <?php if (!$valid) : ?>
            <form method="post" action="add.php" enctype="multipart/form-data">
                <table>
                    <tr>
                        <td>Password:</td>
                        <td><input type="password" name="password" value="<?php echo $password; ?>"></td>
                        <td class="error"><?php echo $password_error ?></td>
                    </tr>
                    <tr>
                        <td>First Name:</td>
                        <td><input type="text" name="fname" value="<?php echo $fname; ?>"></td>
                        <td class="error"><?php echo $fname_error ?></td>
                    </tr>
                    <tr><td>Last Name:</td><td><input type="text" name="lname" value="<?php echo $lname; ?>"></td><td class="error"><?php echo $lname_error ?></td></tr>
                    <tr><td>Gender:</td><td><input type="radio" name="gender" value="male">Male
                            <input type="radio" name="gender" value="female">Female<input type="radio" name="gender" value="other">Other</td><td class="error"><?php echo $gender_error ?></td></tr>
                    <tr><td>Date Of Birth:</td><td><input type="text" name="date" value="<?php echo $date; ?>"> Format: "MM/DD/YYYY"</td><td class="error"><?php echo $date_error ?></td> </tr>
                    <tr><td>Picture:</td><td><input type="file" name="file"></td><td class="error"><?php ?></td> </tr>
                    <tr><td><input type="submit" value="Submit"></td><td></td>
                </table>
            </form>
        <?php else : ?>
            <p> The new student has been added successfully </p>

        <?php endif; ?>
    </body>
</html>

