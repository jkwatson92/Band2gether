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

// Assume $db is a PDO object
$query = $db->query('SELECT DISTINCT Genre FROM BAND ORDER BY ASC'); // Run your query

echo '<select name="Genre">'; // Open your drop down box

// Loop through the query results, outputing the options one by one
while ($row = $query->fetch(PDO::FETCH_ASSOC)) {
   echo '<option value="'.$row['Genre'].'">'.$row['Genre'].'</option>';
}

echo '</select>';// Close your drop down box
?>
<!DOCTYPE html>
<html>
<!-- the body section -->
<body>
  <main>
      <!-- display a list of bands -->
      <h2>Band List</h2>
    <section>
      <!-- display a table of bands -->
      <table>
        <tr>
          <th>Name</th>
          <th>Genre</th>
          <th>Region</th>
          <!-- <th>Email</th>
          <th>Website</th> -->
          <th>&nbsp;</th>
        </tr>
        <?php foreach($bands as $band) : ?>
          <tr>
            <td><?php echo $band['Name']; ?></td>
            <td><?php echo $band['Genre']; ?></td>
            <td><?php echo $band['Region']; ?></td>
            <!-- <td><?php echo $band['Email']; ?></td> -->
            <!-- Need to add in as hyperlink -->
            <!-- <td class="right" a href="#"><?php echo $band['Website']; ?></td> -->
            <!-- <td><form action="delete_tech.php" method="post">
              <input type="hidden" name="tech_id" value="<?php echo $tech['techID']; ?>">
              <input type="submit" value="Delete">
            </form></td> -->
          </tr>
        <?php endforeach; ?>
      </table>
      <!-- <p><a href="add_tech_form.php">Add Technician</a></p> -->
    </section>
  </main>
</body>
</html>
<!-- <?php include '../view/footer.php'; ?> -->
