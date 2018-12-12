<?php
//Get the Band's data
$SearchName = filter_input(INPUT_POST,'NameSearch');
$name=filter_input(INPUT_POST,'Name');
$gen=filter_input(INPUT_POST,'Genre');
$start=filter_input(INPUT_POST,'Creation');
$end=filter_input(INPUT_POST,'Disband');
$reg=filter_input(INPUT_POST,'Region');
$contact=filter_input(INPUT_POST,'Email');
$site=filter_input(INPUT_POST,'Website');


//Validate inputs
if($name==null ||$gen==null|| $start==null||$end==null||$reg==null||$contact==null||$site==null){
    $error="Invalid data. Check all fields and try again.";
}else{
    require_once('../model/database.php');
}
//Add the new band data to the database
$query="UPDATE BAND SET Name='".$name."', Genre='".$gen."', Creation='".$start."', Disband='".$end."', Region='".$reg."', Email='".$contact."', Website='".$site."' WHERE Name='".$SearchName."'";
$statement = $db->prepare($query);
$statement->execute();
$statement->closeCursor();

//Display the Bands Page
include('index.php');

?>
