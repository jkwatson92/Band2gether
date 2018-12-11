<?php include '../view/header.php';
require('../model/database.php');

$band_genre=filter_input(INPUT_POST,'Genre');

echo("<script>console.log('PHP: ".$band_genre."');</script>");

$allBands = 'SELECT * FROM BAND WHERE Genre =:band_genre';
$statement = $db->prepare($allBands);
$statement->bindValue(':band_genre',$band_genre);
$statement->execute();
$bands=$statement->fetchAll();
$statement->closeCursor();
?>

<!DOCTYPE html>
<html>
<body>
<section>
  <h2> Results</h2>
<!-- display a table of bands  -->
  <table>
    <tr>
      <th>Name</th>
      <th>Genre</th>
      <th>Region</th>
      <th>&nbsp;</th>
    </tr>
    <?php foreach($bands as $band) : ?>
      <tr>
        <td><?php echo $band['Name']; ?></td>
        <td><?php echo $band['Genre']; ?></td>
        <td><?php echo $band['Region']; ?></td>
        <td><form action="edit_band.php" method="post">
          <input type="hidden" name="band_name" value="<?php echo $band['Name']; ?>">
          <input name="submit" type="submit" value="Edit">
        </form></td>
      </tr>
    <?php endforeach; ?>
  </table>
  <!-- <p><a href="add_tech_form.php">Add Technician</a></p> -->
</section>
</body>
</html>
