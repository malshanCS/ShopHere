<?php
// get pid from url
$productID = $_GET['productID'];

//use Database\DBController;

use Database\DBController;
use Database\product;

$db = new DBController();

$product = new Product($db);
$product_variants = array_slice($product->getProductVarients('product_variant',$productID),0);

//print_r($product_variants);


// $i=0;
$Varientnames=array();
foreach ($product_variants as $item) {
    $Varientnames[] = $item['productVariantName'];
    //  i+=1;
}$product_variants;

//print_r($Varientnames);
//print_r($product_variants);




foreach ($product_shuffle as $i) {
    if(intval($i['ID'])==$productID){
        $item=$i;
    }
}
$product_shuffle ?>

<section class="product py-3">
    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <img src="<?php echo $item['image']??"./assets/products/iphone13pro.jpg" ?>"  alt="product" class="img-fluid">
                <!-- <div class="form-row pt-4 font-size-16 font-rubik">
                    <div class="col">
                        <button type="submit" class="btn btn-danger form-control">Buy now</button>
                    </div>

                    <div class="col">
                        <button type="submit" class="btn btn-warning form-control">Add to Cart</button>
                    </div>
                </div> -->
            </div>

            <div class="col-sm-6 py-5">
                <h5 class="font-baloo font-size-20"><?php echo $item['title']?></h5>
                <small>by <?php echo $item['brand']?></small>
                <!-- <div class="d-flex">
                    <div class="rating text-warning font-size-12">
                        <span><i class="fas fa-star"></i></span>
                        <span><i class="fas fa-star"></i></span>
                        <span><i class="fas fa-star"></i></span>
                        <span><i class="fas fa-star"></i></span>
                        <span><i class="far fa-star"></i></span>
                    </div>
                    <a href="#" class="px-2 font-rale font-size-14">20,534 ratings | 1000+ answered questions</a>
                </div> -->

                <hr class="m-0">


                <div>
                    <table>
                        <tr>
                            <td>
                                <!-- Product varient selection -->
                                <div>
                                    <form method="POST" action="" id="variant_form">
                                        <label for="product_variant">Select Product Variant:</label><br>
                                        <select name="product_variant" id="product_variant" onchange="document.getElementById('variant_form').submit()">
                                            <?php
                                            if ($_SERVER['REQUEST_METHOD'] == 'POST') {
                                                $selected_variant = $_POST['product_variant'];
                                            } else {
                                                $selected_variant = $Varientnames[0];
                                            }

                                            foreach ($Varientnames as $variant) {
                                                if ($variant == $selected_variant) {
                                                    echo "<option value='$variant' selected>$variant</option>";
                                                } else {
                                                    echo "<option value='$variant'>$variant</option>";
                                                }
                                            }
                                            ?>
                                        </select>
                                    </form>

                                    <?php
                                    if (isset($_POST['quantity'])) {
                                        $selected_variant=$_POST['v'];
                                    }

                                    echo "You selected: $selected_variant";
                                    $selected_item=null;
                                    foreach ($product_variants as $item) {
                                        if($item['productVariantName']== $selected_variant){
                                            $selected_item=$item;
                                        }
                                    }$product_variants;




                                    $temp = $product->getAvailableQuantity($selected_item['sku']);
                                    $itemsInStock_SelectedVarient = $temp[0]['avai_stock'];


                                    ?>

                                </div>
                                <?php echo 'IN STOCK: ',$itemsInStock_SelectedVarient?>

                            </td>
                            <td>
                                <!-- dynamic product price section -->
                                <div>
                                    <table class="my-3">
                                        <!-- <tr class="font-rale font-size-14">
                                            <td>Previous Price:</td>
                                            <td><strike>$162.00</strike></td>
                                        </tr> -->
                                        <tr class="font-rale font-size-14">
                                            <td>Price:</td>
                                            <td class="font-size-20 text-danger">Rs.<span><?php echo $selected_item['unit_price']?></span><small class="text-dark font-size-12">&nbsp;&nbsp;*Terms and Condition apply</small></td>
                                        </tr>
                                        <!-- <tr class="font-rale font-size-14">
                                            <td>You Save:</td>
                                            <td><span class="font-size-16 text-danger">$10.00</span></td>
                                        </tr> -->
                                    </table>
                                </div>
                            </td>
                        </tr>

                    </table>
                </div>








                <div>


                    <!-- <form method="post">
  <label for="quantity">Enter quantity:</label><br>
  <input type="text" id="quantity" name="quantity" value=1 ><br>
  <input type="hidden" name="v" value="<?php echo $selected_variant; ?>">
  <input type="submit" value="Submit">
</form>  -->

                    <?php
                    $quantity=1;
                    if (isset($_POST['quantity'])) {
                        $quantity = $_POST['quantity'];
                        if($quantity>$itemsInStock_SelectedVarient){
                            echo "SORRY! Only ",$itemsInStock_SelectedVarient," items in stock!";
                            $quantity=1;
                        }
                        // else{
                        //     echo "Quantity : " ,$quantity;
                        // }

                    }
                    // else{
                    //     $quantity=1;
                    //     echo "Quantity : " , $quantity;
                    // }




                    ?>

                    <?php $userID=1;
                    ?>
                    <div>
                        <button type="button" class="btn btn-warning font-size-12"
                                onclick="window.location.href = 'addToCart.php?sku=<?php echo  $selected_item['sku']?> & uid=<?php echo $userID ?> & pid=<?php echo $productID ?>' ;">Add to Cart
                        </button>
                    </div>

























                    <!--    #policy -->
                    <div id="policy">
                        <div class="d-flex">
                            <div class="return text-center mr-5">
                                <div class="font-size-20 my-2 color-second">
                                    <span class="fas fa-retweet border p-3 rounded-pill"></span>
                                </div>
                                <a href="#" class="font-rale font-size-12">10 Days <br> Replacement</a>
                            </div>
                            <div class="return text-center mr-5">
                                <div class="font-size-20 my-2 color-second">
                                    <span class="fas fa-truck  border p-3 rounded-pill"></span>
                                </div>
                                <a href="#" class="font-rale font-size-12">Daily Tuition <br>Deliverd</a>
                            </div>
                            <div class="return text-center mr-5">
                                <div class="font-size-20 my-2 color-second">
                                    <span class="fas fa-check-double border p-3 rounded-pill"></span>
                                </div>
                                <a href="#" class="font-rale font-size-12">1 Year <br>Warranty</a>
                            </div>
                        </div>
                    </div>


                    <!--    !policy -->
                    <hr>

                    <!-- order-details -->
                    <div id="order-details" class="font-rale d-flex flex-column text-dark">
                        <small>Delivery by : Mar 29  - Apr 1</small>
                        <small>Sold by <a href="#">Daily Electronics </a>(4.5 out of 5 | 18,198 ratings)</small>
                        <small><i class="fas fa-map-marker-alt color-primary"></i>&nbsp;&nbsp;Deliver to Customer - 424201</small>
                    </div>
                    <!-- !order-details -->

                    <div class="row">
                        <div class="col-6">
                            <!-- color -->
                            <!-- <div class="color my-3">
                                <div class="d-flex justify-content-between">
                                    <h6 class="font-baloo">Color:</h6>
                                    <div class="p-2 color-yellow-bg rounded-circle"><button class="btn font-size-14"></button></div>
                                    <div class="p-2 color-primary-bg rounded-circle"><button class="btn font-size-14"></button></div>
                                    <div class="p-2 color-second-bg rounded-circle"><button class="btn font-size-14"></button></div>
                                </div>
                            </div> -->
                            <!-- !color -->
                        </div>

                    </div>



                    <!-- size -->
                    <!-- <div class="size my-3">
                        <h6 class="font-baloo">Size :</h6>
                        <div class="d-flex justify-content-between w-75">
                            <div class="font-rubik border p-2">
                                <button class="btn p-0 font-size-14">4GB RAM</button>
                            </div>
                            <div class="font-rubik border p-2">
                                <button class="btn p-0 font-size-14">6GB RAM</button>
                            </div>
                            <div class="font-rubik border p-2">
                                <button class="btn p-0 font-size-14">8GB RAM</button>
                            </div>
                        </div>
                    </div> -->
                    <!-- !size -->


                </div>

                <div class="col-12">
                    <h6 class="font-rubik">Product Description</h6>
                    <hr>
                    <p class="font-rale font-size-14">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Repellat inventore vero numquam error est ipsa, consequuntur temporibus debitis nobis sit, delectus officia ducimus dolorum sed corrupti. Sapiente optio sunt provident, accusantium eligendi eius reiciendis animi? Laboriosam, optio qui? Numquam, quo fuga. Maiores minus, accusantium velit numquam a aliquam vitae vel?</p>
                    <p class="font-rale font-size-14">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Repellat inventore vero numquam error est ipsa, consequuntur temporibus debitis nobis sit, delectus officia ducimus dolorum sed corrupti. Sapiente optio sunt provident, accusantium eligendi eius reiciendis animi? Laboriosam, optio qui? Numquam, quo fuga. Maiores minus, accusantium velit numquam a aliquam vitae vel?</p>
                </div>



            </div>
        </div>
</section>

