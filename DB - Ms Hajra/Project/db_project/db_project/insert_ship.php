<?php
    require "conn.php";

    // echo "hello";
    if(isset($_POST['submit'])){
        if(!empty($_POST['shipid']) && !empty($_POST['route']) && !empty($_POST['LOCATION']) && !empty($_POST['noOfContainers']) && !empty($_POST['WEIGHT']) && !empty($_POST['refuelDuration']) && !empty($_POST['pricePerHour']) && !empty($_POST['portId']))
        {

            $shipid = $_POST['shipid'];
            $route = $_POST['route'];
            $LOCATION = $_POST['LOCATION'];
            $noOfContainers = $_POST['noOfContainers'];
            $WEIGHT = $_POST['WEIGHT'];
            $refuelDuration = $_POST['refuelDuration'];
            $pricePerHour = $_POST['pricePerHour'];
            $portId = $_POST['portId'];



            $insert =  $conn->prepare("insert into SHIPS VALUES(?,?,?,CURTIME(),?,?,?,?,CURDATE(),?)");

            $insert->execute(array(
                 $shipid,
                 $route,
                 $LOCATION,
                 $noOfContainers,
                 $WEIGHT,
                 $refuelDuration,
                 $pricePerHour,
                 $portId
            ));
 
            header("location: dashboardsidebar.php");
        }
        else{

            header("location: newShip.php");

        }
    }


?>