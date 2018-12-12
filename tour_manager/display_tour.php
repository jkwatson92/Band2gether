<?php include '../view/header.php';
require('../model/database.php');

function debug_to_console( $data ) {
    $output = $data;
    if ( is_array( $output ) )
        $output = implode( ',', $output);

    echo "<script>console.log( 'Debug Objects: " . $output . "' );</script>";
}

// $bandName = $_GET['Name'];
$tourID = filter_input(INPUT_POST, 'tour_id');
$tourName = filter_input(INPUT_POST, 'tour_name');
$headlinerName = filter_input(INPUT_POST, 'headliner_name');
$query= 'SELECT * FROM SHOWS WHERE Tour_ID =:tourID';
$statement = $db->prepare($query);
$statement->bindValue(':tourID',$tourID);
$statement->execute();
$shows=$statement->fetchAll();
debug_to_console($shows);
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
            <td><?php echo $show['Date'];?></td>
            <td><?php echo $show['Time']; ?></td>
            <?php
              $tourDate = $show['Date'];
              $query= 'SELECT * FROM OPENER WHERE Tour_ID =:tourID AND Date = $tourDate';
              $statement = $db->prepare($query);
              $statement->bindValue(':tourDate',$tourDate);
              $statement->bindValue(':tourID',$tourID);
              $statement->execute();
              $openers=$statement->fetchAll();
              $statement->closeCursor(); ?>
            <?php foreach($openers as $opener):
              $openerList = $openerList + $opener['Band'] + '<br>' ?>
              <td><?php echo $openerList; ?>.</td>
            <?php endforeach; ?>
            <td><form action="going_show.php" method="post">
              <input type="hidden" name="tour_id" value="<?php echo $tourID; ?>">
              <input type="hidden" name="tour_name" value="<?php echo $tourName; ?>">
              <input type="hidden" name="show_date" value="<?php echo $tour['Date']; ?>">
              <input type="hidden" name="show_date" value="<?php echo $openerList; ?>">
              <input name="submit" type="submit" value="GOING!"></td>
          </tr>
        <?php endforeach; ?>
      </table>
    </section>
  </main>
</body>
</html>
<!-- <?php include '../view/footer.php'; ?> -->
