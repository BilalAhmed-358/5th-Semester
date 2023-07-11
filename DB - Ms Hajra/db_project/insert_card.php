<?php
    require "conn.php";

    // echo "hello";
    if(isset($_POST['submit'])){
        if(!empty($_POST['cardNo']) && !empty($_POST['threeDigitSecurityCode'])  && !empty($_POST['expiryDate']) && !empty($_POST['cardType'])&& !empty($_POST['paymentId']))
        {

            $cardNo = $_POST['cardNo'];
            $threeDigitSecurityCode = $_POST['threeDigitSecurityCode'];
            $expiryDate = $_POST['expiryDate'];
            $cardType = $_POST['cardType'];
            $paymentId = $_POST['paymentId'];


            $insert =  $conn->prepare("insert into Credit(CARDNO,CCNO,EXPDATE,CARDTYPE,PAYMENTID) VALUES(?,?,?,?,?)");

            $insert->execute(array(
                 $cardNo,
                 $threeDigitSecurityCode,
                 $expiryDate,
                 $cardType,
                 $paymentId
            ));

            header("location: customer.php");
        }
        else{

            header("location: newpayment.php");

        }
    }


?>