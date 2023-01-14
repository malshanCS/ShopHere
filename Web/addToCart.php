<?php
echo "Item Added to cart!";
////////////Data passed through url /////
$cartSKU = $_GET['sku'];
$UID = $_GET['uid'];
$PID =$_GET['pid'];
/////////////////////////////////////////

//Query required to run/////////////////
$q="call add_to_cart('{$UID}','{$cartSKU}');";
////////////////////////////////////////

use Database\DBController;
use Database\product;

require('Database/DBController.php');
require('Database/Product.php');

$db = new DBController();


$db->con->query($q);


?>
</br>
<a href="cart.php" class="btn btn-danger">Go to cart</a>
</br>
<a href="index.php" class="btn btn-danger" >Go to home</a>