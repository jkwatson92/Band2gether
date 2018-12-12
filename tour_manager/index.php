<?php include '../view/header.php'; ?>
<?php
require('../model/database.php');

//Get all Tours
$allTours = 'SELECT * FROM TOUR ORDER BY TOUR_ID DESC ';
$statement = $db->prepare($allTours);
$statement->execute();
$tours=$statement->fetchAll();
$statement->closeCursor();
?>

<!DOCTYPE html>
<html>
<!-- the body section -->
<body>
  <main>
      <!-- display a list of artists -->
      <h2>Tour List</h2>
    <section>
      <!-- display a table of artists -->
      <table>
        <tr>
          <th>Tour Name</th>
          <th>Headliner</th>
          <th>&nbsp;</th>
        </tr>
        <?php foreach($tours as $tour) : ?>
          <tr>
            <td><?php echo $tour['Name']; ?></td>
            <td><?php echo $tour['Headliner']; ?></td>
            <td><form action="display_tour.php" method="post">
              <input type="hidden" name="tour_id" value="<?php echo $tour['Tour_ID']; ?>">
              <input type="hidden" name="tour_name" value="<?php echo $tour['Name']; ?>">
              <input type="hidden" name="headliner_name" value="<?php echo $tour['Headliner']; ?>">
              <input name="submit" type="submit" value="Select">
            </form></td>
          </tr>
        <?php endforeach; ?>
      </table>
    </section>
  </main>
</body>
</html>
<!-- <?php include '../view/footer.php'; ?> -->
