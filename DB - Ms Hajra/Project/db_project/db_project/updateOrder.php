<?php


   require "conn.php";

   if(isset($_GET['upd_id'])) {

    $id = $_GET['upd_id'];

    $data = $conn->query("SELECT * FROM ORDERS WHERE ORDERID = '$id'");

  $rows = $data->fetch(PDO::FETCH_OBJ);



  if(isset($_POST['submit'])){
    if( !empty($_POST['orderName'])  && !empty($_POST['quantity']) )
    {

        
        $orderName = $_POST['orderName'];
        // $orderDate = $_POST['orderDate'];
        $quantity = $_POST['quantity'];
        

        
        $update =  $conn->prepare("UPDATE ORDERS SET ORDERNAME=?, ORDERDATE=CURDATE(), QTY=? WHERE ORDERID = '$id'");

        $update->execute(array(
             
             $orderName,
            //  $orderDate,
             $quantity
             
        ));

        header("location: customer.php");
    }
    else{
        header("location: customer.php");

    }
} 
} 

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Order</title>
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
            float: left;
            color: rgb(0, 0, 0);
            text-align: center;
            padding: 12px;
            text-decoration: none;
            font-size: 30px;
            line-height: 20px;
            border-radius: 4px;
            font-weight: bold;
        }
        .form {
            overflow: hidden;
            background-color: #f0f0f0;
            border-radius: 10px;
            border: 2px solid rgb(194, 194, 194);
        }
        .form label, .form input{
            font-size:17px;
            padding:10px 10px;
            text-decoration: none;
            margin-top:10px;
        }   
        .form label{
            font-weight:bold;
            display: inline-block;
            width:100px;
            text-align: left;

        }
        .form .input{
            text-align: left;
            align:right;
            min-width:300px;
        }
        .New_button {
            background-color: #b8990f;
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
            min-width:100px;
            align:left;
        }
    </style>
</head>

<body>
    <div class="header">
        <p class="logo">Update Order</p>
    </div>
        <br><br>
    <div>
    <form action="updateOrder.php?upd_id=<?php echo $id; ?>" method="POST" class="form" >
        <!-- <label for="orderid" class="row">Order Id:</label>
        <input class="input" type="text" name="orderid" id="orderid" placeholder="Enter the Orderid">
        <br> -->

        <label for="orderName" class="row">Order Name:</label>
        <input class="input"  type="text" name="orderName" id="orderName" value="<?php echo $rows->ORDERNAME; ?>">
        <br>

        <!-- <label for="orderDate" class="row">Order Date:</label>
        <input class="input"  type="text" name="orderDate" id="orderDate" value="<?php echo $rows->ORDERDATE; ?>">
        <br> -->

        <label for="quantity" class="row">Quantity:</label>
        <input class="input"  type="number" name="quantity" id="quantity" value="<?php echo $rows->QTY; ?>">
        <br>

        <!-- <label for="custid" class="row">Customer Id:</label>
        <input class="input"  type="text" name="custid" id="custid" placeholder="Enter the customer Id">
        <br> -->
        <input  id ="button" type="submit" name="submit" value="Update Order" class="New_button">
    </form>
    </div>
</body>