<?php
use Database\DBController;
$filepath = realpath (dirname(__FILE__));

require_once($filepath."/Database/DBController.php");

function checkout_display_cartitems($productname,$productPrice,$numberOfItems){
    $tot_product_price = $productPrice*$numberOfItems;
    $statement = "<p><a href=\"cart.php\">$productname</a> <span class=\"price\">Rs.$tot_product_price</span></p>";
    echo $statement;
}


function display_billing_address($name="",$email="",$pobox="",$street="",$city="",$province="",$zip=""){
    $detail="<label for=\"fname\"><i class=\"fa fa-user\"></i> Full Name</label>
                <input type=\"text\" id=\"fname\" name=\"firstname\" value='$name' placeholder=\"Malshan Keerthichandra\">
                <label for=\"email\"><i class=\"fa fa-envelope\"></i> Email</label>
                <input type=\"text\" id=\"email\" name=\"email\" value='$email' placeholder=\"malshan@example.com\">
                <label for=\"adr\"><i class=\"fa fa-address-card-o\"></i> Address</label>
                <input type=\"text\" id=\"adr\" name=\"address\" value='$pobox $street' placeholder=\"Katubedda, Moratuwa\">
                <label for=\"city\"><i class=\"fa fa-institution\"></i> City</label>
                <input type=\"text\" id=\"city\" name=\"city\" value='$city' placeholder=\"Moratuwa\">
    
                <div class=\"row\">
                  <div class=\"col-50\">
                    <label for=\"state\">Province</label>
                    <input type=\"text\" id=\"state\" name=\"state\" value='$province' placeholder=\"Western\">
                  </div>
                  <div class=\"col-50\">
                    <label for=\"zip\">Zip</label>
                    <input type=\"text\" id=\"zip\" name=\"zip\" value='$zip' placeholder=\"50000\">
                  </div>
                </div>";
    echo $detail;
}

function display_payment_detail($nameOnCard="",$cardNo="",$expMonth="",$expYear="",$cvv=""){
    $detail = "<label for=\"cname\">Name on Card</label>
                <input type=\"text\" id=\"cname\" name=\"cardname\" value='$nameOnCard' placeholder=\"Malshan Keerthichandra\">
                <label for=\"ccnum\">Credit card number</label>
                <input type=\"text\" id=\"ccnum\" name=\"cardnumber\" value='$cardNo' placeholder=\"1111-2222-3333-4444\">
                <label for=\"expmonth\">Exp Month</label>
                <input type=\"text\" id=\"expmonth\" name=\"expmonth\" value='$expMonth' placeholder=\"November\">
                <div class=\"row\">
                  <div class=\"col-50\">
                    <label for=\"expyear\">Exp Year</label>
                    <input type=\"text\" id=\"expyear\" name=\"expyear\" value='$expYear' placeholder=\"2025\">
                  </div>
                  <div class=\"col-50\">
                    <label for=\"cvv\">CVV</label>
                    <input type=\"text\" id=\"cvv\" name=\"cvv\" value='$cvv' placeholder=\"890\">
                  </div>
                </div>";
    echo $detail;
}

function checkBox_op($name){
    $detail = "<input type=\"checkbox\" name=\"sameadr\" id=\"chbox\" class=\"check-sameaddr\" onclick=\"checkFunction($name)\"> Shipping address same as billing";
    echo $detail;
}

function get_customer_detail($userID)
{
    $db = new DBController();
    $result = $db->con->query("call get_checkout_detail({$userID});");

    $resultArray = array();

    while ($item = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
        $resultArray[] = $item;
    }

    return $resultArray;
}

function get_payment_detail($userID)
{
    $db = new DBController();
    $result = $db->con->query("call get_payment_detail({$userID});");

    $resultArray = array();

    while ($item = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
        $resultArray[] = $item;
    }

    return $resultArray;
}

function is_main_city($cityName){
//    $val = 0;
    $db = new DBController();
    $result = $db->con->query("select city_name from city;");
//    $result2 = $db->con->query("select avai_stock from stock where sku={$sku}");
    $resultArray = array();
//    $result2Array = array();
    while ($item = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
        $resultArray[] = $item;
    }
//    while ($item2 = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
//        $result2Array[] = $item2;
//    }
//
    if(in_array($cityName,$resultArray[0])){
        return 5;
    }
    else{
        return 7;
    }
}

function test_stock($sku,$quantity){
    $db = new DBController();
    $result2 = $db->con->query("select avai_stock from stock where sku='{$sku}';");
    $result2Array = array();
    while ($item2 = mysqli_fetch_array($result2, MYSQLI_ASSOC)) {
        $result2Array[] = $item2;
    }
    if ($result2Array[0]['avai_stock']==0 and $quantity==0){
        return 3;
    }
    else{
        return 0;
    }
}

function delete_checkout($userID){
    $db = new DBController();
    $db->con->query("delete from cart_item where cart_id in (select cart_id from cart where user_id='{$userID}');");
}

function add_order_detail($userID,$subtotal){
    $db = new DBController();
    $db->con->query("call add_order_detail('{$userID}',{$subtotal});");
}

//function fill_admin_report($email,$sales){
//    $db = new DBController();
//    $db->con->query("insert into admin_report (email, sales) VALUES ('{$email}',{$sales});");
//}