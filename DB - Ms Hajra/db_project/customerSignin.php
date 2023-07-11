<?php
require 'config.php';
if(!empty($_SESSION["id"])){
  header("Location: index.php");
}
if(isset($_POST["submit"])){
  $custId = $_POST["custId"];
  $custPassword = $_POST["custPassword"];

  $result = mysqli_query($connection, "SELECT * FROM CUSTOMERS WHERE CUSTID = '$custId' ");
  $row = mysqli_fetch_assoc($result);
  if(mysqli_num_rows($result) > 0){
    if($custPassword == $row['CUSTPASSWORD']){
      $_SESSION["login"] = true;
      $_SESSION["id"] = $row["custid"];
      echo
      "<script> alert('LOGIN SUCCESSFUL'); </script>";
      header("Location: customer.php");
      
    }
    else{
      echo
      "<script> alert('Wrong Password'); </script>";
    }
  }
  else{
    echo
    "<script> alert('User Not Registered'); </script>";
  }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Sign In</title>
    <style>
        body {
            background-color: #f8f8f8;
        }

        .header {
            overflow: hidden;
            background-color: #e4e4e4;
            padding: 10px 10px;
            border-radius: 10px;
        }

        .header p.logo {
            color: rgb(0, 0, 0);
            text-align: center;
            padding: 12px;
            text-decoration: none;
            font-size: 30px;
            line-height: 20px;
            border-radius: 4px;
            vertical-align: center;
            font-weight: bold;
        }

        .form {
            overflow: hidden;
            background-color: #f0f0f0;
            border-radius: 10px;
            border: 2px solid rgb(194, 194, 194);
            text-align: center
        }

        .form label,
        .form input {
            font-size: 17px;
            padding: 10px 10px;
            text-decoration: none;
            margin-top: 10px;
        }

        .form label {
            font-weight: bold;
            /* display: inline-block; */
            width: 100px;
            text-align: left;

        }

        .form .input {
            text-align: left;
            min-width: 300px;
            margin: 10px;
        }

        .New_button {
            background-color: #4CAF50;
            border: none;
            color: white;
            padding: 10px 10px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 13px;
            border-radius: 10px;
            cursor: pointer;
            margin: 20px;
            min-width: 100px;
        }

        .New_button_ {
            background-color: #ff6600;
            border: none;
            color: white;
            padding: 10px 10px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 13px;
            border-radius: 10px;
            cursor: pointer;
            margin: 20px;
            min-width: 100px;
        }
    </style>
</head>

<body>
    <div class="header">
        <p class="logo">Customer SignIn</p>
    </div>
    <br><br>
    <div class="form">
        <form action="" method="POST">
            <br>
            <label for="custId" class="row">Customer Id</label><br>
            <input class="input" type="text" name="custId" id="custId" placeholder="Enter Customer Id">
            <br>

            <label for="custPassword" class="row">Enter Password</label><br>
            <input class="input" type="text" name="custPassword" id="custPassword"
                placeholder="Enter Customer Password">
            <br>

            <input class="New_button" id="button_action" type="submit" name="submit" value="Sign In"
                class="btn btn-default"> 
            </form>
            <a href="customerSignup.php" target="_blank">
            <input class="New_button_" id="button_action" type="submit" name="submit" value="Sign Up"
                class="btn btn-default"></a>
    </div>
</body>