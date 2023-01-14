<?php
$cat_name = $_GET['name'];

// filter products
shuffle($prodcat_shuffle);
$filtered = array_map(function($var){
    global $cat_name;
    if(in_array($cat_name, $var)) return $var;
}, $prodcat_shuffle);

$filtered = array_values(array_filter($filtered));

?>

<section class="allproducts">
    <div class="container">
        <h4 class="font-rubik font-size-40"><?php echo $cat_name?></h4>       
        
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
                            <span><?php echo $item['base']??0 ?></span>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-warning font-size-12">Add to cart</button>
                        </div>

                    </div>
                </div>
            </div>
            <?php }, $filtered) ?>
        </div>
    </div>
</section>

