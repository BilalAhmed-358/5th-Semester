<?php
    require "conn.php";

    // echo "hello";
    if(isset($_POST['submit'])){
        if(!empty($_POST['orderid']) && !empty($_POST['orderName'])  && !empty($_POST['quantity']) && !empty($_POST['customerId']))
        {

            $orderid = $_POST['orderid'];
            $orderName = $_POST['orderName'];
            
            $quantity = $_POST['quantity'];
            $customerId = $_POST['customerId'];


            $insert =  $conn->prepare("insert into ORDERS(ORDERID,ORDERNAME,ORDERDATE,QTY,CUSTID) VALUES(?,?,curdate(),?,?)");

            $insert->execute(array(
                 $orderid,
                 $orderName,
                 $quantity,
                 $customerId
            ));

            header("location: customer.php");
        }
        else{

            header("location: newOrder.php");

        }
    }


?>