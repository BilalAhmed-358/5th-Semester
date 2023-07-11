<?php
    require "conn.php";

    // echo "hello";
    if(isset($_POST['submit'])){
        if(!empty($_POST['portId']) && !empty($_POST['portName']) )
        {

            $portId = $_POST['portId'];
            $portName = $_POST['portName'];


            $insert =  $conn->prepare("insert into PORT(PORTID,PORTNAME) VALUES(?,?)");

            $insert->execute(array(
                 $portId,
                 $portName
            ));

            header("location: dashboardsidebar.php");
        }
        else{

            header("location: newPort.php");

        }
    }


?>