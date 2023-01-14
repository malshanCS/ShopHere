<?php
    session_start();

    //initiate all variable to null
    $firstName = "";
    $lastName = "";
    $email = "";
    $password = "";
    $confirmPassword = "";
    $errors = array();

    // Connect to the database
    $db = mysqli_connect('localhost', 'root', '' , 'shopheredb' , '3308');

    // Check connection
    if (mysqli_connect_errno())
    {
        echo "Failed to connect to MySQL: ". mysqli_connect_error();
        return;
    }

    // When buttonSignUp is clicked
    if (isset($_POST['buttonSignUp'])) {

        $firstName = ($_POST['inputFirstName']);
        $lastName = $_POST['inputLastName'];
        $email = $_POST['inputEmail'];
        $password = $_POST['inputPassword'];
        $confirmPassword = $_POST['inputConfirmPassword'];

        // Check input fields

        //make sure all fields are filled
        if (empty($firstName) || empty($lastName) || empty($email) || empty($password) || empty($confirmPassword) ) {
            $errors[] = "Please fill all the required fields";
        } 
        if ($password != $confirmPassword){
            $errors[] = "Password and Confirm Password do not match";
        }

        if (count($errors) > 0){
            foreach ($errors as $error){
                echo $error . "<br>";
            }
        } else {
            $passwordEncrypted = md5($password);
            $sqlQuery = "INSERT INTO registered_customer (first_name  , last_name , email , password )
                    VALUES ('$firstName','$lastName','$email','$passwordEncrypted')" ;
            mysqli_query($db, $sqlQuery);

            //log user in
            $_SESSION['userName'] = $firstName;
            $_SESSION['userID'] = $email;
            $_SESSION['success'] = "You are now logged in";
            header("Location: ../index.php"); //Need to check

        }
    
    }

    // log user 
    if (isset($_POST['buttonSignIn'])) {

        $email = $_POST['inputEmailLogin'];
        $password = $_POST['inputPasswordLogin'];

        // Check input fields
        //make sure all fields are filled
        if (empty($email) || empty($password)) {
            $errors[] = "Please fill all the required fields";
        } 
    
        if (count($errors) > 0){
            foreach ($errors as $error){
                echo "<br>";
                echo '<script>alert("$error");</script>';
                echo "<br>";
              
            }

        } else {

            $passwordEncrypted = md5($password);
            $sqlQuery = "SELECT first_name FROM registered_customer WHERE email = '$email' AND password = '$passwordEncrypted'"; 
            $result = mysqli_query($db, $sqlQuery);

            if (mysqli_num_rows($result)==1){
                //log user in

                $row = $result->fetch_assoc();
                $firstname = $row['firstname'];
                
                $_SESSION['userID'] = $email;
                $_SESSION['userName'] = $firstName;
                $_SESSION['success'] = "You are now logged in";
                header("Location: ../header.php"); //Need to check
            
            } else {
                $errors[] = "Email or Password do not match";
                foreach ($errors as $error){
                    echo "<br>";
                    echo '<script>alert($error);</script>';
                    echo "<br>";
                  
                }
                header("Location: ../login.php"); //Sign in again
            } 
            
        }
    
    }


    // logout
    if (isset($_GET['logout'])) {
        session_destroy();
        unset($_SESSION['userName']);
        header('location: header.php');
    }

?>

