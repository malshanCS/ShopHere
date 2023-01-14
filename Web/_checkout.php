<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="checkout.css">

    <title>Checkout</title>

    

</head>
<body>
<?php

//namespace Database;
require_once ('./_cartFunctions.php');
require_once ('./checkoutFunctions.php');
$userID = 1;
$resultArray = getCartItems($userID);
$subtotal = 0;
$del_days = 0;
$number_of_items = count($resultArray);
$customer_detail = get_customer_detail($userID);
$payment = get_payment_detail($userID);
//foreach ($customer_detail as $item){
//    cartItem($item['image'],$item['title'],$item['unit_price'],$item['brand'],$item['item_id'],$item['quantity'],$item['avai_stock']);
//
//}

$firstname = $customer_detail[0]['first_name'];
$lastname =  $customer_detail[0]['last_name'];
$mail = $customer_detail[0]['email'];
$po = $customer_detail[0]['PO_box'];
$street = $customer_detail[0]['street'];
$town = $customer_detail[0]['city_name'];
$province =$customer_detail[0]['province'];
$z = $customer_detail[0]['zip_code'];

$name_on_card = $payment[0]['name_in_card'];
$card_no = $payment[0]['card_no'];
$exp_year = $payment[0]['exp_year'];
$exp_month = $payment[0]['exp_month'];
$cvv = $payment[0]['cvv'];

?>

    <div class="row">
      <div class="col-75">
        <div class="container">
          <form action="./checkout.php">
          
            <div class="row">
              <div class="col-50">
                <h3>Billing Address</h3>
                  <?php
//                    display_billing_address("Malshan","malshan@example.com","254","Katubedda","Moratuwa","Western","400");


//                    display_billing_address();
                  ?>
                <label for="fname"><i class="fa fa-user"></i> Full Name</label>
                <input type="text" id="fname" name="firstname"  placeholder="John Doe">
                <label for="email"><i class="fa fa-envelope"></i> Email</label>
                <input type="text" id="email" name="email"  placeholder="john@example.com">
                <label for="adr"><i class="fa fa-address-card-o"></i> Address</label>
                <input type="text" id="adr" name="address"  placeholder="New York, USA">
                <label for="city"><i class="fa fa-institution"></i> City</label>
                <input type="text" id="city" name="city"  placeholder="Kandy">

                <div class="row">
                  <div class="col-50">
                    <label for="state">Province</label>
                    <input type="text" id="state" name="state" placeholder="Central">
                  </div>
                  <div class="col-50">
                    <label for="zip">Zip</label>
                    <input type="text" id="zip" name="zip" placeholder="100">
                  </div>
                </div>
<!-- ===============================================================================================                 -->
              </div>
    
              <div class="col-50">
                <h3>Payment</h3>
                <label for="fname">Accepted Cards</label>
                <div class="icon-container">
                  <i class="fa fa-cc-visa" style="color:navy;"></i>
                  <i class="fa fa-cc-amex" style="color:blue;"></i>
                  <i class="fa fa-cc-mastercard" style="color:red;"></i>
                  <i class="fa fa-cc-discover" style="color:orange;"></i>
                </div>
                  <?php
//                    display_payment_detail("Malshan Keerthichandra","1111-2222-3333-4444","January","2025","100");
//                    display_payment_detail();
                  ?>
                <label for="cname">Name on Card</label>
                <input type="text" id="cname" name="cardname"  placeholder="John Doe">
                <label for="ccnum">Credit card number</label>
                <input type="text" id="ccnum" name="cardnumber"  placeholder="xxxx-xxxx-xxxx-xxxx">
                <label for="expmonth">Exp Month</label>
                <input type="text" id="expmonth" name="expmonth"  placeholder="01">
                <div class="row">
                  <div class="col-50">
                    <label for="expyear">Exp Year</label>
                    <input type="text" id="expyear" name="expyear"  placeholder="1999">
                  </div>
                  <div class="col-50">
                    <label for="cvv">CVV</label>
                    <input type="text" id="cvv" name="cvv"  placeholder="xxx">
                  </div>
                </div>
<!--    ===================================================================================================              -->
              </div>


              
            </div>
            <input type="checkbox" id="chboxerer"> Shipping address same as billing >

            <input type="submit" value="Checkout!" class="btn checkout-submit" onclick="checkout()">
          </form>
        </div>
      </div>
      <div class="col-25">
        <div class="container">
          <h4>Cart <span class="price" style="color:black"><i class="fa fa-shopping-cart"></i> <b><?php echo $number_of_items ?></b></span></h4>
            <?php
                foreach ($resultArray as $item){
                    checkout_display_cartitems($item['title'],$item['unit_price'],$item['quantity']);
                    if ($del_days==0){
                        $del_days = test_stock($item['sku'],$item['quantity']);
                    }
                    $subtotal = $subtotal+(float)$item['unit_price']*$item['quantity'];
                }
            ?>
          <hr>
          <p>Total <span class="price" style="color:black"><b>Rs.<?php echo $subtotal ?></b></span></p>
            <br>
            <p>Days to deliver:  <b><?php echo is_main_city($town)+$del_days ?></p>
        </div>
      </div>
    </div>

<script type="text/javascript">
    var firstname = "<?php echo $firstname; ?>";
    var lasttname = "<?php echo $lastname; ?>"
    var mail = "<?php echo $mail; ?>"
    var po_box = "<?php echo $po; ?>"
    var street = "<?php echo $street; ?>"
    var town = "<?php echo $town; ?>"
    var province = "<?php echo $province; ?>"
    var z = "<?php echo $z; ?>"
    var name_on_card = "<?php echo $name_on_card; ?>"
    var card_no = "<?php echo $card_no; ?>"
    var exp_year = "<?php echo $exp_year; ?>"
    var exp_month = "<?php echo $exp_month; ?>"
    var cvv_code = "<?php echo $cvv; ?>"
    //
    //
    function checkFunction(){
        var checkdd = document.getElementById("email");
        var checkBox = document.getElementById("chboxerer");
        if (checkBox.checked === true){
            // fname.value = firstname+" "+lasttname;
            document.getElementById('email').value = mail;
            document.getElementById("fname").value = firstname + " " + lasttname;
            document.getElementById("adr").value = po_box+","+street;
            document.getElementById("cname").value = name_on_card;
            document.getElementById("city").value = town;
            document.getElementById("state").value = province;
            document.getElementById("zip").value = z;

            document.getElementById("ccnum").value = card_no;
            document.getElementById("expyear").value = exp_year;
            document.getElementById("expmonth").value = exp_month;
            document.getElementById("cvv").value = cvv_code;

            // adr.value = po_box+","+street;
            // city.value = town;
            // state.value = province;
            // zip.value = z;
            // cname.value = name_on_card;
            // ccnum.value = card_no;
            // expmonth.value = exp_month;
            // expyear.value = exp_year;
            // cvv.value = cvv_code;
        }else{
            document.getElementById('email').value = "";
            document.getElementById("fname").value =  "";
            document.getElementById("adr").value =  "";
            document.getElementById("cname").value =  "";
            document.getElementById("city").value =  "";
            document.getElementById("state").value =  "";
            document.getElementById("zip").value =  "";

            document.getElementById("ccnum").value =  "";
            document.getElementById("expyear").value =  "";
            document.getElementById("expmonth").value =  "";
            document.getElementById("cvv").value =  "";
        }
    }
</script>

<script>

var userID = "<?php echo $userID; ?>"
function checkout(){
    <?php
    delete_checkout($userID);
    add_order_detail($userID,$subtotal);
//    fill_admin_report($mail,$subtotal);

    ?>
}
</script>
<script>
    document.getElementById("chboxerer").addEventListener("click",checkFunction);
</script>


    </body>
</html>
