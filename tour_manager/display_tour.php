<?php include '../view/header.php';
require('../model/database.php');

// $bandName = $_GET['Name'];
$tourID = filter_input(INPUT_POST, 'tour_id');
$tourName = filter_input(INPUT_POST, 'tour_name');
$headlinerName = filter_input(INPUT_POST, 'headliner_name');
$query= 'SELECT * FROM SHOWS WHERE Tour_ID =:tourID';
$statement = $db->prepare($query);
$statement->bindValue(':tourID',$tourID);
$statement->execute();
$shows=$statement->fetchAll();
$statement->closeCursor();

?>
<!DOCTYPE html>
<html>
<!-- the body section -->
<body>
  <main>
      <!-- display a list of artists -->
      <h2>Shows on the <?php echo $tourName; ?> Tour</h2>
    <section>
      <!-- display a table of shows -->
      <table>
        <tr>
          <th>Venue</th>
          <th>Headliner</th>
          <th>Date</th>
          <th>Time</th>
          <th>Openers</th>
          <th>&nbsp;</th>
        </tr>
        <?php foreach($shows as $show) : ?>
        <tr>
          <td><?php echo $show['Venue']; ?></td>
          <td><?php echo $headlinerName; ?></td>
          <td><?php echo $show['Show_Date'];?></td>
          <td><?php echo $show['Time']; ?></td>
          <?php
            $tourDate = $show['Show_Date'];
            $query= 'SELECT * FROM OPENER WHERE Tour_ID =:tourID AND Show_Date = :tourDate';
            $statement = $db->prepare($query);
            $statement->bindValue(':tourDate',$tourDate);
            $statement->bindValue(':tourID',$tourID);
            $statement->execute();
            $openers=$statement->fetchAll();
            $statement->closeCursor(); ?>
          <?php
            $openerList = "";
            foreach($openers as $opener):
              $openerList = $openerList . $opener['Band'] . '<br>'; ?>
          <?php endforeach; ?>
          <td><?php echo $openerList; ?></td>
          <td><form action="going_show.php" method="post">
            <input type="hidden" name="tour_id" value="<?php echo $tourID; ?>">
            <input type="hidden" name="tour_name" value="<?php echo $tourName; ?>">
            <input type="hidden" name="show_date" value="<?php echo $tour['Show_Date']; ?>">
            <input type="hidden" name="opener_list" value="<?php echo $openerList; ?>">
            <input type="hidden" name="headliner_name" value="<?php echo $headlinerName; ?>">
            <input name="submit" type="submit" value="GOING!"></td>
          <?php endforeach; ?>
        </tr>
      </table>
    </section>
  </main>
</body>
</html>
<!-- <?php include '../view/footer.php'; ?> -->
