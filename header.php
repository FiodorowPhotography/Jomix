<?php
include 'laczenieBaza.php';
session_start();

$_SESSION['tab_koszyk_produkty'] = array();
$_SESSION['tab_koszyk_ilosc'] = array();
?>

<nav class="navbar navbar-expand-lg navbar-light bg-white">
  <div class="container-fluid">
    <a class="navbar-brand logoheader" href="index.php"><img src="zdjecia/jomix-300.png" width="100" height="50" /></a>


    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>


    <div class="zwijanemenu">
      <nav class="navbar centruj">

        <form class="d-flex" role="search">
          <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-success" type="submit">Szukaj</button>
        </form>

      </nav>
    </div>



    <div class="collapse navbar-collapse naglowek" id="navbarNavDropdown">
      <ul class="navbar-nav">

        <?php
        $wyswietl_kategorie = mysqli_query($lacz, "SELECT kategoriaID, nazwa_kategorii from kategorie");

        while ($jaka_kategoria = @mysqli_fetch_array($wyswietl_kategorie)) {
          echo '
              <li class="nav-item">
                <a class="nav-link" href="Produkty.php?katID=' . $jaka_kategoria['kategoriaID'] . '">' . $jaka_kategoria['nazwa_kategorii'] . '</a>
              </li>
          ';
        }
        ?>




      </ul>

      <ul class="navbar-nav headerikony">

        <li class="nav-item">
          <a class="nav-link" href="Koszyk.php"><img src="zdjecia/cart.png" width="30" height="30"></a>
        </li>

        <li class="nav-item">
          <a class="nav-link" href="
          <?php
          if (isset($_SESSION['userID'])) {
            echo "user.php";
          } else {
            echo "logowanie.php";
          }

          ?>"><img src="zdjecia/account.png"></a>
        </li>

      </ul>

    </div>
  </div>
</nav>