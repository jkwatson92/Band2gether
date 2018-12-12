<?php include '../view/header.php';
require('../model/database.php');

// $bandName = $_GET['Name'];
$artistId = filter_input(INPUT_POST, 'artistId');

$query= 'SELECT * FRom ARTIST WHERE id =:artistId';
$statement = $db->prepare($query);
$statement->bindValue(':artistId',$artistId);
$statement->execute();
$artists=$statement->fetchAll();
$statement->closeCursor();
foreach($artists as $artist) :
$artist_name=$artist['Name'];
$dob=$artist['DOB'];
$nickname=$artist['Nickname'];
$contact=$artist['Email'];

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
          <label>Name:</label><input type="text" name="Name" value="<?php echo $artist_name; ?>"><br>
          <label>DOB:</label><input type="text" name="DOB" value="<?php echo $dob; ?>"><br>
          <label>Nickname:</label><input type="text" name="Nickname" value="<?php echo $nickname; ?>"><br>
          <label>Email:</label><input type="text" name="Email" value="<?php echo $contact; ?>"><br>
		  <input type='hidden' name="ArtistId" value="<?php echo $artistId; ?>">
          <input type="submit" value="Update Info" id="label">
          <br><br>
        </form>
    </section>
  </main>
</body>
</html>
