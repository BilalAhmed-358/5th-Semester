<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New Payment</title>
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
            min-width:100px;
            align:left;
        }
    </style>
</head>

<body>
    <div class="header">
        <p class="logo">New Payment</p>
    </div>
        <br><br>
    <div>
    <form action="insert_payment.php" method="POST" class="form" >
        <label for="paymentId" class="row">Payment Id:</label>
        <input class="input" type="text" name="paymentId" id="paymentId" placeholder="Enter the Payment Id">
        <br>

        <label for="amount" class="row">Amount:</label>
        <input class="input"  type="text" name="amount" id="amount" placeholder="Enter the Amount">
        <br>

        <label for="paymentType" class="row">Payment Type:</label>
        <input class="input"  type="text" name="paymentType" id="paymentType" placeholder="Enter the payment type">
        <br>

        <label for="tax" class="row">Tax:</label>
        <input class="input"  type="text" name="tax" id="tax" placeholder="Enter the TAX %">
        <br>

        <label for="orderid" class="row">Order ID:</label>
        <input class="input"  type="text" name="orderid" id="orderid" placeholder="Enter the Order ID">
        <br>

        <input  class="New_button" id ="button" type="submit" name="submit" value="Create new Payment" class="btn btn-default">
    </form>
    </div>
    <br><br>
    <div class="header">
        <p class="logo">New Credit Info</p>
    </div>
    <br><br>
    <form action="insert_card.php" method="POST" class="form" >
    <label for="cardNo" class="row">Card Number:</label>
    <input class="input" type="text" name="cardNo" id="cardNo" placeholder="Enter card number">
    <br>

    <label for="threeDigitSecurityCode" class="row">Three digit Security Code:</label>
    <input class="input"  type="text" name="threeDigitSecurityCode" id="threeDigitSecurityCode" placeholder="Enter the three digit security code">
    <br>

    <label for="expiryDate" class="row">Expiry Date:</label>
    <input class="input"  type="text" name="expiryDate" id="expiryDate" placeholder="Enter the expiry date">
    <br>

    <label for="cardType" class="row">Card Type:</label>
    <input class="input"  type="text" name="cardType" id="cardType" placeholder="Enter the card type visa/mastercard">
    <br>

    <label for="paymentId" class="row">Payment ID:</label>
    <input class="input"  type="text" name="paymentId" id="paymentId" placeholder="Enter the payment Id">
    <br>

    <input  class="New_button" id ="button" type="submit" name="submit" value="Create new Credit" class="btn btn-default">
    </form>
</body>