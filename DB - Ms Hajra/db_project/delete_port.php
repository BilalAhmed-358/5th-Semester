<?php

  require "conn.php";

  if(isset($_GET['del_id'])) {

  	$id = $_GET['del_id'];

  	$delete = $conn->prepare("DELETE FROM PORT WHERE PORTID=:id");

  	$delete->execute([':id' => $id]);

  	header("location: dashboardsidebar.php");
  }

  ?>