<?php include '../view/header.php';
require('../model/database.php');

// $bandName = $_GET['Name'];
$bandName = filter_input(INPUT_POST, 'band_name');

$query= 'SELECT * FROM BAND WHERE Name =:bandName';
$statement = $db->prepare($query);
$statement->bindValue(':bandName',$bandName);
$statement->execute();
$bands=$statement->fetchAll();
$statement->closeCursor();
foreach($bands as $band) :
$band_name=$band['Name'];
$gen=$band['Genre'];
$start=$band['Creation'];
$end=$band['Disband'];
$reg=$band['Region'];
$contact=$band['Email'];
$site=$band['Website'];

endforeach;
?>
<!DOCTYPE html>
<html>
<!-- the body section -->
<body>
  <main>
      <h2>View/Update Band Information</h2>
      <br>
      <section id="aligned">
      <form action="update.php" method="post">
          <label>Name:</label><input type="text" name="Name" value="<?php echo $band_name; ?>"><br>
          <label>Genre:</label><input type="text" name="Genre" value="<?php echo $gen; ?>"><br>
          <label>Creation Date:</label><input type="text" name="Creation" value="<?php echo $start; ?>"><br>
          <label>Disband Date:</label><input type="text" name="Disband" value="<?php echo $end; ?>"><br>
          <label>Region:</label><input type="text" name="Region" value="<?php echo $reg; ?>"><br>
          <label>Contact Email:</label><input type="text" name="Email" value="<?php echo $contact; ?>"><br>
          <label>Website:</label><input type="text" name="Website" value="<?php echo $site; ?>"><br>
		  <input type='hidden' name="Name" value="<?php echo $band_name; ?>">
          <input type="submit" value="Update Info" id="label">
          <br><br>
        </form>
    </section>
  </main>
</body>
</html>
