<?php
    require "conn.php";

    // echo "hello";
    if(isset($_POST['submit'])){
        if(!empty($_POST['containerid']) && !empty($_POST['goods_name'])&& !empty($_POST['shipid']))
        {

            $containerid = $_POST['containerid'];
            $goods_name = $_POST['goods_name'];
            $shipid = $_POST['shipid'];


            $insert =  $conn->prepare("insert into CONTAINERS(CONTAINERID,GOODS_NAME,SHIPID) VALUES(?,?,?)");

            $insert->execute(array(
                 $containerid,
                 $goods_name,
                 $shipid
            ));

            header("location: dashboardsidebar.php");
        }
        else{

            header("location: newContainer.php");

        }
    }


?>