<!-- Display the technicians  -->
<?php include '../view/header.php'; ?>
<?php
require('../model/database.php');


//Get all artists
$allArtists = 'SELECT * FROM ARTIST ORDER BY Name';
$statement = $db->prepare($allArtists);
$statement->execute();
$artists=$statement->fetchAll();
$statement->closeCursor();
?>
<!DOCTYPE html>
<html>
<!-- the body section -->
<body>
  <main>
      <!-- display a list of artists -->
      <h2>Artist List</h2>
    <section>
      <!-- display a table of artists -->
      <table>
        <tr>
          <th>Name</th>
          <th>DOB</th>
          <th>Nickname</th>
          <th>Email</th>
			<th>&nbsp;</th>
        </tr>
        <?php foreach($artists as $artist) : ?>
          <tr>
            <td><?php echo $artist['Name']; ?></td>
            <td><?php echo $artist['DOB']; ?></td>
            <td><?php echo $artist['Nickname']; ?></td>
            <td><?php echo $artist['Email']; ?></td>
            <!-- Need to add in as hyperlink -->
            <!--<td class="right" a href="#"><?php echo $band['Website']; ?></td>-->
		  <td><form action="edit_artist.php" method="post">
          <input type="hidden" name="artistId" value="<?php echo $artist['Id']; ?>">
          <input name="submit" type="submit" value="Edit">
        </form></td>
          </tr>
        <?php endforeach; ?>
      </table>
      <!-- <p><a href="add_tech_form.php">Add Technician</a></p> -->
    </section>
  </main>
</body>
</html>
<!-- <?php include '../view/footer.php'; ?> -->
