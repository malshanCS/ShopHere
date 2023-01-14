<?php

//use Database\DBController;

use Database\DBController;
use Database\product;

require('./Database/DBController.php');
require('./Database/Product.php');

$db = new DBController();

$product = new Product($db);
$product_shuffle = $product->getData();

$prodcat_shuffle = $product->getData('prodcat');


$product_variants = array_slice($product->getProductVarients('product_variant',2),0);

//print_r($product->getProductVarients('product_variant',2))

//print_r($product_shuffle);




