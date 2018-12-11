<!-- Display the technicians  -->
<?php include '../view/header.php'; ?>
<?php
require('../model/database.php');


//Get all bands
$allBands = 'SELECT * FROM BAND ORDER BY Name';
$statement = $db->prepare($allBands);
$statement->execute();
$bands=$statement->fetchAll();
$statement->closeCursor();
?>
<!DOCTYPE html>
<html>
<!-- the body section -->
<body>
  <main>
      <!-- display a list of bands -->
      <h2>Band List</h2>
      <h3>Filter By Genre:</h3>
      <form action="filter_results.php" method="post">
        <select name="Genre">
        <option value="Alternative">Alternative</option>
        <option value="Classic">Classic</option>
        <option value="Country">Country</option>
        <option value="Disco">Disco</option>
        <option value="Heavy Metal">Heavy Metal</option>
        <option value="Hip Hop">Hip Hop</option>
        <option value="Pop">Pop</option>
        <option value="Punk">Punk</option>
        <option value="Reggae">Reggae</option>
        <option value="Rock">Rock</option>
        <input type="submit" name="submit" value="Select">
      </form>
      <br>
      <br>
  </main>
</body>
</html>
<!-- <?php include '../view/footer.php'; ?> -->
