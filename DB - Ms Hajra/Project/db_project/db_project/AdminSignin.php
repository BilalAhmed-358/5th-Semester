<?php
require 'config.php';

if(isset($_POST["submit"])){
  $adminId = $_POST["adminId"];
  $adminPassword = $_POST["adminPassword"];

  $result = mysqli_query($connection, "SELECT * FROM ADMINS WHERE ADMINID = '$adminId' ");
  $row = mysqli_fetch_assoc($result);
  if(mysqli_num_rows($result) > 0){
    if($adminPassword == $row['ADMINPASSWORD']){
        
      $_SESSION["login"] = true;
      $_SESSION["id"] = $row["ADMINID"];
      echo
      "<script> alert('LOGIN SUCCESSFUL'); </script>";
      header("Location: dashboardsidebar.php");
      
    }
    else{
      echo
      "<script> alert('WRONG PASSWORD'); </script>";
    }
  }
  else{
    echo
    "<script> alert('ADMIN NOT REGISTERED'); </script>";
  }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Sign In</title>
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
    </style>
</head>

<body>
    <div class="header">
        <p class="logo">Admin SignIn</p>
    </div>
    <br><br>
    <div class="form">
        <form action="" method="POST">
            <br>
            <label for="adminId" class="row">Admin Id</label><br>
            <input class="input" type="text" name="adminId" id="adminId" placeholder="Enter Admin Id">
            <br>

            <label for="adminPassword" class="row">Enter Password</label><br>
            <input class="input" type="text" name="adminPassword" id="adminPassword"
                placeholder="Enter Admin Password">
            <br>

            <input class="New_button" id="button_action" type="submit" name="submit" value="Sign In"
                class="btn btn-default">
        </form>
    </div>
</body>