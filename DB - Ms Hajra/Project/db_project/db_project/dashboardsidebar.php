<?php

require "conn.php";


$data = $conn->query("SELECT * FROM CUSTOMERS");
$data1 =$conn->query("SELECT * FROM PORT");


?>



<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Panel</title>

  <link rel="stylesheet" href="mystyle.css">

  <style>
    body 
    {
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

  @media screen and (max-width: 500px) {
      .header a {
          float: none;
          display: block;
          text-align: left;
      }

      .header-right {
          float: none;
      }
  }
  .customer {
            overflow: hidden;
            background-color: #f0f0f0;
            padding: 20px 10px;
            border-radius: 10px;
            border: 2px solid rgb(194, 194, 194);
        }
        .table {
            border-collapse: collapse;
            margin: 25px 0;
            font-size: 1.05em;
            min-width: 500px;
        }

        .table thead tr {
            background-color: #cfcfcf;
            text-align: left;
            font-weight: bold;
        }

        .table th,
        .table td {
            padding: 12px 15px;
        }

        .table tbody tr {
            border-bottom: 1px solid #dddddd;
        }
        .New_button {
            background-color: #4CAF50;
            border: none;
            color: white;
            padding: 10px 15px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            border-radius: 10px;
            cursor: pointer;
            margin-right: 20px;
        }
        .Delete_button {
            background-color: rgb(255, 0, 0);
            border: none;
            color: white;
            padding: 10px 10px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 15px;
            border-radius: 10px;
            cursor: pointer;
            margin-right: 20px;
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
  </style>
</head>
  <body>
    <div class="header">
        <p href="#default" class="logo">Admin portal</p>
        <div class="header-right">
        <a class="active" href="homepage.php">LOGOUT</a>
        <!-- <a href="#contact">Contact</a>
        <a href="#about">About</a> -->
    </div>
    </div>
    <br>
    <br>
    <div class="customer">
        <h2>Customers</h2>
        <table class="table">
            <thead>
                <tr>
                    <th>
                        Customer ID
                    </th>
                    <th>
                        Customer Name
                    </th>
                    <th>
                        Customer Address
                    </th>
                    <th>
                        Delete Entry
                    </th>
                </tr>
            </thead>
            <tbody>
            <?php while($rows_cust = $data->fetch(PDO::FETCH_OBJ)): ?>
              <tr>
                <td>
                <?php echo $rows_cust->CUSTID   ;?>
                </td>
                <td>
                <?php echo $rows_cust->CUSTNAME   ;?>
                </td>
                <td>
                <?php echo $rows_cust->CUSTADDRESS   ;?>
                </td>
                <td>
                <a href="delete_cust.php?del_id=<?php echo $rows_cust->CUSTID; ?>"><button class="Delete_button" type="button">DELETE</button></a>
                </td>
              </tr>
              <?php endwhile; ?>
            </tbody>
        </table>

    </div>

    <br><br>
    <div class="customer">
        <h2>Ports</h2>
        <table class="table">
            <thead>
                <tr>
                    <th>
                        Port ID
                    </th>
                    <th>
                        Port Name
                    </th>
                    <th>
                        Delete Entry
                    </th>
                </tr>
            </thead>
            <tbody>
            <?php while($rows_port = $data1->fetch(PDO::FETCH_OBJ)): ?>
              <tr>
                <td>
                <?php echo $rows_port->PORTID   ;?>
                </td>
                <td>
                <?php echo $rows_port->PORTNAME   ;?>
                </td>
                <td>
                <a href="delete_port.php?del_id=<?php echo $rows_port->PORTID; ?>"><button class="Delete_button" type="button">DELETE</button></a>
                </td>
              </tr>
              <?php endwhile; ?>
            </tbody>
        </table>
        <a href="newPort.php" target="_blank"><button class="New_button" type="button">Add Port</button></a>

    </div>
    <br>
    <br>
    <div class="customer">
        <h2>Ships</h2>

        <form action="" method="GET">
          <label for="portid" class="row">Search Port ID to get data of ships docked on that port:</label>
          <input class="form-control" type="text" name="portid" id="portid" required value="<?php if(isset($_GET['portid'])){echo $_GET['portid']; } ?>" placeholder="Enter port ID">
          <input  id ="button_action" type="submit" name="submit" value="Search for ships" class="btn btn-default">
        </form>

        <table class="table">
            <thead>
                <tr>
                    <th>
                        Ship ID
                    </th>
                    <th>
                        Route
                    </th>
                    <th>
                        Docktime
                    </th>
                    <th>
                        Number of containers
                    </th>
                    <th>
                        Weight
                    </th>
                    <th>
                        Refuel Duration
                    </th>
                    <th>
                        Price per hour
                    </th>
                    <th>
                        Arrival date
                    </th>
                    <th>
                        Container Id
                    </th>
                    <th>
                        Port Id
                    </th>
                    <th>
                        Delete Entry
                    </th>
                </tr>
            </thead>
            <tbody>
            <?php 
                $con = mysqli_connect("localhost","root","","freight");
                      if(isset($_GET['portid']))
                       {
                        $portid = $_GET['portid'];
                        $query = "SELECT * FROM SHIPS WHERE PORTID=$portid ";
                        $query_run = mysqli_query($con, $query);
                        if(mysqli_num_rows($query_run) > 0)
                        {
                          foreach($query_run as $items)
                          {
                             ?>
                             <tr>
                                <td><?= $items['SHIPID']; ?></td>
                                <td><?= $items['ROUTE']; ?></td>
                                <td><?= $items['LOCATION']; ?></td>
                                <td><?= $items['DOCKTIME']; ?></td>
                                <td><?= $items['NOOFCONTAINERS']; ?></td>
                                <td><?= $items['WEIGHT']; ?></td>
                                <td><?= $items['REFUELDURATION']; ?></td>
                                <td><?= $items['PRICEPERHOUR']; ?></td>
                                <td><?= $items['ARRIVAL_DATE']; ?></td>
                                <td><?= $items['PORTID']; ?></td>
                                <td>
                                   <a href="delete_ship.php?del_id=<?= $items['SHIPID']; ?>"><button class="Delete_button" type="button">DELETE</button></a>
                          </td>
                             </tr>
                             <?php
                          }
                        }
                        else
                        {
                            ?>
                            <tr>
                                <td colspan="10">No Record Found</td>
                            </tr>
                            <?php
                        }
                       }
                   ?>

            </tbody>
        </table>
        <a href="newShip.php" target="_blank"><button class="New_button" type="button">Add ship</button></a>

    </div>

    <br>
    <br>
    <div class="customer">
        <h2>Containers</h2>

        <form action="" method="GET">
          <label for="shipid" class="row">Search Ship Id to see container data:</label>
          <input class="form-control" type="text" name="shipid" id="shipid" required value="<?php if(isset($_GET['shipid'])){echo $_GET['shipid']; } ?>" placeholder="Enter ship ID">
          <input  id ="button_action" type="submit" name="submit"  class="btn btn-primart">
        </form>

        <table class="table">
            <thead>
                <tr>
                    <th>
                        Container Id
                    </th>
                    <th>
                        Goods name
                    </th>
                    <th>
                        Delete Entry
                    </th>
                </tr>
            </thead>
            <tbody>
            <?php 
                $con = mysqli_connect("localhost","root","","freight");
                      if(isset($_GET['shipid']))
                       {
                        $shipid = $_GET['shipid'];
                        $query = "SELECT * FROM CONTAINERS WHERE SHIPID=$shipid ";
                        $query_run = mysqli_query($con, $query);
                        if(mysqli_num_rows($query_run) > 0)
                        {
                          foreach($query_run as $items)
                          {
                             ?>
                             <tr>
                                <td><?= $items['CONTAINERID']; ?></td>
                                <td><?= $items['GOODS_NAME']; ?></td>
                                <td>
                                <a href="delete_container.php?del_id=<?= $items['CONTAINERID']; ?>"><button class="Delete_button" type="button">DELETE</button></a>
                                </td>
                             </tr>
                             <?php
                          }
                        }
                        else
                        {
                            ?>
                            <tr>
                                <td colspan="2">No Record Found</td>
                            </tr>
                            <?php
                        }
                       }
                   ?>

            </tbody>
        </table>
        <a href="newContainer.php" target="_blank"><button class="New_button" type="button">Add container</button></a>

    </div>
  </body>
</html>