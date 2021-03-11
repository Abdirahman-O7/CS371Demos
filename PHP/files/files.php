<!DOCTYPE html>
<html>
<body>

<?php


if(file_exists("testfile.txt")) //checks whether a file exists
    echo "File exists";

//writing to a file
$fh = fopen("testfile.txt", 'w') or die("Failed to create file");
//the text to write to a file
$text = "Line 1\n Line 2\n Line 3\n Line 4\n";

fwrite($fh, $text) or die("Could not write to file");
fclose($fh); //close the file



//reading from a file
$fh = fopen("testfile.txt", 'r') or
        die("File does not exist or you lack permission to open it");

while (!feof($fh)) { //as long as the file didn't end
    echo fgets($fh) . "<br />"; //read the next line
}

fclose($fh);

//copies the contents of testfile.txt into testfile2.txt
if (!copy('testfile.txt', 'testfile2.txt'))
    echo "Could not copy file";
else
    echo "File successfully copied to 'testfile2.txt'";


//renames a file
if (!rename('testfile2.txt', 'testfile2.new'))
    echo "Could not rename file";
  else echo "File successfully renamed to 'testfile2.new'";
  
  //deletes a file
 /* if (!unlink('files/testfile2.new')) echo "Could not delete file";
  else echo "File 'testfile2.new' successfully deleted";*/
?>

</body>
</html>
