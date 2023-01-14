<?php
shuffle($prodcat_shuffle);
$name = array_map(function ($pro){ return $pro['name']; }, $prodcat_shuffle);
$unique = array_unique($name);

?>

<section class="allproducts" id="allprods">
    <div class="container">
        <h4 class="font-rubik font-size-20">All Products</h4>
        <div id="filters" class="button-group text-right">
            <button class="btn is-checked" data-filter="*">All Products</button>
            <?php
            array_map(function ($name){
                printf('<button class="btn is-checked" data-filter=".%s">%s</button>', $name, $name);
            }, $unique);
            ?>
        </div>

        <!--            <button class="btn is-checked" data-filter="*">All Brands</button>-->
        <!--            <button class="btn is-checked" data-filter=".Mobile-Phones">Mobile Phones</button>-->
        <!--            <button class="btn is-checked" data-filter=".Headphones">Headphones</button>-->
        <!--            <button class="btn is-checked" data-filter=".Accessories">Accessories</button>-->

        <div class="grid">
            <?php array_map(function ($item){ ?>
                <div class="grid-item border <?php echo $item['name']; ?> ">
                    <div class="item py-2" style="width: 200px; height:350px">
                        <div class="product font-raleway">

                            <a href="product.php?productID=<?php echo $item['ID'] ?>"><img src="<?php echo $item['image']??"./assets/products/iphone13pro.jpg" ?>" alt="product1" class="img-fluid"></a>
                            <div class="text-center">
                                <a href="product.php?productID=<?php echo $item['ID'] ?>"><h6><?php echo $item['title']??"Unknown" ?></h6></a>

                                <div class="rating font-size-12">
                                    <span><i class="fas fa-star text-warning"></i></span>
                                    <span><i class="fas fa-star text-warning"></i></span>
                                    <span><i class="fas fa-star text-warning"></i></span>
                                    <span><i class="fas fa-star text-warning"></i></span>
                                    <span><i class="far fa-star text-warning"></i></span>
                                </div>
                            </div>

                            <div class="price py-2">
                                <span>Rs.<?php echo $item['base']??0 ?></span>
                            </div>
                            <div class="text-center">
                                <button onclick="location.href='https://google.com';" type="submit" class="btn btn-warning font-size-12">Add to cart</button>
                            </div>

                        </div>
                    </div>
                </div>
            <?php }, $prodcat_shuffle) ?>



        </div>




    </div>
</section>

