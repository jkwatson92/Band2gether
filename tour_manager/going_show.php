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
      <h2>Thanks for letting <?php echo $headlinerName?> know!</h2>
    <section>

    </section>
  </main>
</body>
</html>

<!-- <?php include '../view/footer.php'; ?> -->
<?php header( "refresh:10;url=index.php" ); ?>
