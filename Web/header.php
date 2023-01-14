<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title >ShopHere</title>

    <!-- Bootstrap CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <!-- Owl-carousel CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" integrity="sha256-UhQQ4fxEeABh4JrcmAJ1+16id/1dnlOEVCFOxDef9Lw=" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css" integrity="sha256-kksNxjDRxd/5+jGurZUJd1sdR2v+ClrCl3svESBaJqw=" crossorigin="anonymous" />


    <!-- font awesome icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" integrity="sha256-h20CPZ0QyXlBuAw7A+KluUYx/3pK+c7lYEpqLTlxjYQ=" crossorigin="anonymous" />
    <!-- custome css file -->
    <!--    <link rel="stylesheet" href="./style.css" type="text/css">-->
    <style>
        <?php include "style.css" ?>
    </style>

    <?php
    require('functions.php');
    require_once ('_cartFunctions.php');
    $count = get_cartitem_count('1');
    ?>


</head>

<body>
    <!-- header -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.1.3/TweenMax.min.js"></script>


    <header id="header">
        <div class="strip d-flex justify-content-between px-4 py-1 bg-light">
            <p class="font-raleway font-size-12 text-black-50 m-0">This is an intellectual property of Malshan Keerthichandra</p>
            <div class="font-raleway font-size-14">
                <a href="#" class="px-3 border-right border-left text-dark">Login</a>

            </div>
        </div>


        <!-- primary navigation -->
        <nav class="navbar navbar-expand-lg navbar-dark color-second-bg">
            <a class="navbar-brand" href="index.php">ShopHere</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav m-auto font-rubik">
                    <li class="nav-item active">
                        <a class="nav-link" href="#hot-items">On Sale</a>
                    </li>
<!--                    <li class="nav-item">-->
<!--                        <a class="nav-link" href="#">Category<i class="fas fa-chevron-down"></i></a>-->
<!--                    </li>-->
                    <li class="nav-item">
                        <a class="nav-link" href="index.php#allprods">Products</i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Blog</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Coming soon</a>
                    </li>
                </ul>

                <form action="#" class="font-size-14 font-raleway">
                    <a href="cart.php" class="py-2 rounded-pill bg-dark">
                        <span class="font-size-16 px-2 text-white"><i class="fas fa-shopping-cart"></i></span>
                        <span class="px-3 py-2 rounded-pill text-dark bg-light"><?php echo $count?></span>
                    </a>

                </form>

            </div>
        </nav>
        <!-- end primary navigation -->


    </header>

    <!--end header  -->

    <!-- main site -->
    <main id="main-site">