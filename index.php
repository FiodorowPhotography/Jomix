<html>

<head>
  <?php include 'head.php'; ?>
  <title>Strona główna</title>
</head>

<body>
  <div class="container-fluid p-0">
    <?php include("header.php"); ?>

    <div id="carouselExampleInterval" class="carousel slide" data-mdb-ride="carousel">
      <div class="carousel-inner">
        <div class="carousel-item active" data-mdb-interval="10000">
          <img src="zdjecia/slide1.jpg" class="d-block w-100" />
        </div>
        <div class="carousel-item" data-mdb-interval="2000">
          <img src="zdjecia/slide2.jpg" class="d-block w-100" />
        </div>
        <div class="carousel-item">
          <img src="zdjecia/slide3.jpg" class="d-block w-100" />
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>

    <div class="container-lg">

      <h1>NOWOŚCI</h1>
      <?php
      $nowosci = mysqli_query($lacz, "SELECT produktID,nazwa_produktu, cena, img_url, nazwa_kategorii, promocja from produkty inner join kategorie on produkty.kategoriaID = kategorie.kategoriaID ORDER BY produktID DESC LIMIT 4");
      ?>
      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 col ">
        <?php while ($row = @mysqli_fetch_array($nowosci)) {
          $sumuj_ilosc = mysqli_query($lacz, 'SELECT sum(ilosc) as suma_ilosc FROM szczegoly_produktu WHERE produktID=' . $row['produktID'] . '');
          $sumuj_ilosc_array = mysqli_fetch_array($sumuj_ilosc);
          if (intval($sumuj_ilosc_array['suma_ilosc']) > 0) {
            echo '<div class="col">';
            echo '<a href="Produkt.php?produktID=' . $row['produktID'] . '">';
            echo    '<div class="card shadow-sm">';
            echo      '<img src="' . $row['img_url'] . '">';
            echo      '<h4>' . $row['nazwa_produktu'] . '</h4>';
            echo      '<p>' . $row['nazwa_kategorii'] . '</p>';
            if ($row['promocja'] > 0) {
              echo '<h5><s>' . $row['cena'] . '</s> ' . $row['promocja'] . '</h5>';
            } else {
              echo     '<h5>' . $row['cena'] . '</h5>';
            }
            echo    '</div>';
            echo  '</a>';
            echo '</div>';
          }
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