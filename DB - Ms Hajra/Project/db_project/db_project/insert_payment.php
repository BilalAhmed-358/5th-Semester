<?php
    require "conn.php";

    // echo "hello";
    if(isset($_POST['submit'])){
        
        if(!empty($_POST['paymentId']) && !empty($_POST['amount']) && !empty($_POST['paymentType']) && !empty($_POST['tax']) && !empty($_POST['orderid']))
        {

            $paymentId = $_POST['paymentId'];
            $amount = $_POST['amount'];
            $paymentType = $_POST['paymentType'];
            $tax = $_POST['tax'];
            $orderid = $_POST['orderid'];


            $insert =  $conn->prepare("insert into PAYMENTS(PAYMENTID,AMOUNT,PAYMENTTYPE,TAX,ORDERID) VALUES(?,?,?,?,?)");

            $insert->execute(array(
                 $paymentId,
                 $amount,
                 $paymentType,
                 $tax,
                 $orderid
            ));

            header("location: customer.php");
        }
        else{
            header("location: newPayment.php");
            echo "Enter all fields";
        }
    }


?>