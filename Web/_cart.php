<?php

//namespace Database;
require_once ('./_cartFunctions.php');

$resultArray = getCartItems(1);
$subtotal = 0;
$number_of_items = count($resultArray);

?>

<section id="cart" class="py-3">
    <div class="container-fluid w-75">
        <h5 class="font-baloo font-size-20">Shopping Cart</h5>

        <!--  shopping cart items   -->
        <div class="row">
            <div class="col-sm-9">
                <!-- cart item -->
                <?php
                foreach ($resultArray as $item){
                    cartItem($item['image'],$item['title'],$item['unit_price'],$item['brand'],$item['item_id'],$item['quantity'],$item['avai_stock']);
                    $subtotal = $subtotal+(float)$item['unit_price']*$item['quantity'];
                }
                //cartItem("./assets/products/iphone13.jpg","Iphone 13",140,"Apple",1);

                ?>
                <!-- !cart item -->

            </div>

            <!-- subtotal section-->
            <div class="col-sm-3">
                <div class="sub-total border text-center mt-2">
                    <h6 class="font-size-12 font-rale text-success py-3"><i class="fas fa-check"></i>FREE delivery</h6>
                    <div class="border-top py-4">
                        <h5 class="font-baloo font-size-20">Subtotal (<?php echo $number_of_items ?> item):&nbsp;<span class="text-danger"><br>Rs.<span class="text-danger" id="deal-price"><?php echo $subtotal ?></span> </span> </h5>
                        <a href="checkout.php">
                            <button type="submit" class="btn btn-warning mt-3" >Proceed checkout</button>
                        </a>
                    </div>
                </div>
            </div>
            <!-- !subtotal section-->
        </div>
        <!--  !shopping cart items   -->
    </div>
</section>
