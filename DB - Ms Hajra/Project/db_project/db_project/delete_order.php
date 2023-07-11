<?php

  require "conn.php";

  if(isset($_GET['del_id'])) {

  	$id = $_GET['del_id'];

  	$delete = $conn->prepare("DELETE FROM orders WHERE ORDERID=:id");

  	$delete->execute([':id' => $id]);

  	header("location: customer.php");
  }

  ?>