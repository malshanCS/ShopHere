<?php

//namespace Database;
use Database\DBController;
$filepath = realpath (dirname(__FILE__));

require_once($filepath."/Database/DBController.php");


function cartItem($productimg,$productname,$productprice,$brandname,$item_id,$quantity,$avai_stock){
    $item = "
    <div class=\"row border-top py-3 mt-3\">
    <div class=\"col-sm-2\">
        <img src=$productimg style=\"height: 120px;\" alt=\"cart1\" class=\"img-fluid\">
    </div>
    <div class=\"col-sm-8\">
        <h5 class=\"font-baloo font-size-20\">$productname</h5>
        <small>by $brandname</small>
        <!-- product rating -->
        <div class=\"d-flex\">
            <div class=\"rating text-warning font-size-12\">
                <span><i class=\"fas fa-star\"></i></span>
                <span><i class=\"fas fa-star\"></i></span>
                <span><i class=\"fas fa-star\"></i></span>
                <span><i class=\"fas fa-star\"></i></span>
                <span><i class=\"far fa-star\"></i></span>
            </div>
            <a href=\"#\" class=\"px-2 font-rale font-size-14\">20,534 ratings</a>
        </div>
        <!--  !product rating-->

        <!-- product qty -->
        <div class=\"qty d-flex pt-2\">
            <div class=\"d-flex font-rale w-25\">
                <button class=\"qty-up border bg-light\" data-id=\"up$item_id\"><i class=\"fas fa-angle-up\"></i></button>
                <input type=\"number\" data-id=\"pro$item_id\" class=\"qty_input border px-2 w-100 bg-light\" value=\"$quantity\" max=$avai_stock placeholder=\"0\">
                <button data-id=\"down$item_id\" class=\"qty-down border bg-light\"><i class=\"fas fa-angle-down\"></i></button>
            </div>
            <button type=\"button\" class=\"btn font-baloo text-danger px-3 remove-btn\" id='remove$item_id'>Remove from cart</button>
            
        </div>
        <!-- !product qty -->

    </div>

    <div class=\"col-sm-2 text-right\">
        <div class=\"font-size-20 text-danger font-baloo\">
            Rs.<span class=\"product_price\">$productprice</span>
        </div>
    </div>
</div>
   " ;
    echo $item;

}


function getCartItems($userID)
{
    $db = new DBController();
    $result = $db->con->query("call get_cart_items({$userID});");

    $resultArray = array();

    while ($item = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
        $resultArray[] = $item;
    }

    return $resultArray;
}

function dnd($data) {

    echo '<pre>';
    var_dump($data);
    echo "</pre>";
    die();
}

function deleteCartItems($itemID){
    $db2 = new DBController();
//    $db2->con->query("delete from cart_item where item_id=$itemID;");
    $db2->con->query("call delete_cart_item({$itemID});");
}

function increment_quantity($id){
    $db3 = new DBController();
    $db3->con->query("call update_quantity({$id});");
}

function decrement_quantity($id){
    $db3 = new DBController();
    $db3->con->query("call update_quantity_dec ({$id});");
}

function get_cartitem_count($userID){
    $db4 = new DBController();
    $result=$db4->con->query("select count(item_id) from cart_item where cart_id in (select cart_id from cart where user_id = {$userID});")->fetch_assoc();
    return $result['count(item_id)'];
}

function add_to_cart ($userID,$sku){
    $db5 = new DBController();
    $db5->con->query("call add_to_cart({$userID},$sku);");
}

if (isset($_POST['action'])){
//    echo '<pre>';
//    var_dump($_POST);
//    echo "</pre>";
//    die();
    //dnd(realpath (dirname(__FILE__)));
    $action = $_POST['action'];
    switch ($action){
        case "remove":
            $id = substr($_POST['id'],6);
//            dnd($id);
            deleteCartItems($id);
            break;
        case "increment":
            $id = substr($_POST['id'],2);
            increment_quantity($id);
            break;
        case "decrement":
            $id = substr($_POST['id'],4);
            decrement_quantity($id);
            break;
        case "add":
             $sku= $_POST['id'];
             add_to_cart('1',$sku);
    }
}
