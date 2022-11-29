<?php
  include("header.php");
?>


        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="zdjecia/produkt.jpg"/></div>
                    <div class="col-md-6">
                        <div class="small mb-1">SKU: 546-498</div>
                        <h1 class="display-5 fw-bolder">Klasyczny komplet w kratę
                        </h1>
                        <div class="fs-5 mb-5">
                            <span class="text-decoration-line-through">119.99zł</span>
                            <span>99.99zł</span>
                        </div>
                        <p class="lead">Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium at dolorem quidem modi. Nam sequi consequatur obcaecati excepturi alias magni, accusamus eius blanditiis delectus ipsam minima ea iste laborum vero?</p>
                        <div class="d-flex">
                            <input class="form-control text-center me-3" id="inputQuantity" type="num" value="1" style="max-width: 3rem" />
                            <form action="size" style="margin: 10px; font-size: 16px;">
                              <select name="Rozmiar">
                                <option>S-36</option>
                                <option>M-38</option>
                                <option>L-40</option>
                                <option>XL-42</option>
                              </select>
                            </form>
                            <button class="btn btn-outline-dark flex-shrink-0" type="button">
                                <i class="bi-cart-fill me-1"></i>
                                Dodaj do koszyka
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="py-5 bg-light">
            <div class="container px-4 px-lg-5 mt-5">
                <h2 class="fw-bolder mb-4">Podobne produkty</h2>
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <img class="card-img-top" src="zdjecia/produkt.jpg"/>
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <h5 class="fw-bolder">Klasyczny komplet w kratę</h5>
                                    119.99zł
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Szczegóły</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <img class="card-img-top" src="zdjecia/produkt.jpg"/>
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <h5 class="fw-bolder">Klasyczny komplet w kratę</h5>
                                    119.99zł
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Szczegóły</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <img class="card-img-top" src="zdjecia/produkt.jpg"/>
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <h5 class="fw-bolder">Klasyczny komplet w kratę</h5>
                                    119.99zł
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Szczegóły</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <img class="card-img-top" src="zdjecia/produkt.jpg"/>
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <h5 class="fw-bolder">Klasyczny komplet w kratę</h5>
                                    119.99zł
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Szczegóły</a></div>
                            </div>
                        </div>
                    </div>
                    

                        
                   
                </div>
            </div>
        </section>

       
      <div class="b-example-divider"></div>

      <div class="container">
        <?php
          include("footer.php");
        ?>
      </div>
      
      <div class="b-example-divider"></div>
</section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
