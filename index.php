<html>

<head>
  <?php include 'head.php'; ?>
  <title>Strona główna</title>
</head>

<body>
  <div class="container-fluid p-0">
    <?php include("header.php"); ?>

    <div class="container-lg">

      <h1>NOWOŚCI</h1>
      <?php
      $nowosci = mysqli_query($lacz, "SELECT produktID,nazwa_produktu, cena, img_url, nazwa_kategorii from produkty inner join kategorie on produkty.kategoriaID = kategorie.kategoriaID ORDER BY produktID DESC LIMIT 4");
      ?>
      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 col ">
        <?php while ($row = @mysqli_fetch_array($nowosci)) {
          echo '<div class="col">';
          echo '<a href="Produkt.php?produktID=' . $row['produktID'] . '">';
          echo    '<div class="card shadow-sm">';
          echo      '<img src="' . $row['img_url'] . '">';
          echo      '<h4>' . $row['nazwa_produktu'] . '</h4>';
          echo      '<p>' . $row['nazwa_kategorii'] . '</p>';
          echo      '<h5>' . $row['cena'] . '</h5>';
          echo    '</div>';
          echo  '</a>';
          echo '</div>';
        } ?>
      </div>
      <br>
      <div class="absolute">
        <img src="zdjecia/atuty.jpg" class="img-fluid d-none d-lg-block w-100">
      </div>
      <br>
      <div>
        <img src="zdjecia/baner.jpg" class="img-fluid w-100">
      </div>
    </div>
    <?php include 'footer.php'; ?>
  </div>
</body>

</html>