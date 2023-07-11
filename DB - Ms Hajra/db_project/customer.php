
<?php

require "conn.php";


$data = $conn->query("SELECT * FROM ORDERS");
$data1 = $conn->query("SELECT * FROM PAYMENTS");

?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer</title>

    <link rel="stylesheet" href="mystyle.css">


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

        .order {
            overflow: hidden;
            background-color: #f0f0f0;
            padding: 20px 10px;
            border-radius: 10px;
            border: 2px solid rgb(194, 194, 194);
        }

        .payments {
            overflow: hidden;
            background-color: #f0f0f0;
            padding: 20px 10px;
            border-radius: 10px;
            border: 2px solid rgb(194, 194, 194);
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

        .Update_button {
            background-color: #b8990f;
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
    </style>
</head>

<body>
    <div class="header">
        <p href="#default" class="logo">Customer Portal</p>
        <div class="header-right">
        <a class="active" href="logout.php">LOGOUT</a>
        <!-- <a href="#contact">Contact</a>
        <a href="#about">About</a> -->
    </div>
    </div>

    <br>
    <br>
    <div class="order">
        <h2>Orders </h2>
        <table class="table">
            <thead>
                <tr>
                    <th>
                        Order ID
                    </th>
                    <th>
                        Order Name
                    </th>
                    <th>
                        Order Date
                    </th>
                    <th>
                        Quantity
                    </th>
                    <th>
                        Customer Id
                    </th>
                    <th>
                        Update Entry
                    </th>
                    <th>
                        Delete Entry
                    </th>
                </tr>
            </thead>
            <tbody>
            <?php while($rows_order = $data->fetch(PDO::FETCH_OBJ)): ?>
                <tr>
                    <td><?php echo $rows_order->ORDERID   ;?></td>
                    <td><?php echo $rows_order->ORDERNAME   ;?></td>
                    <td><?php echo $rows_order->ORDERDATE   ;?></td>
                    <td><?php echo $rows_order->QTY   ;?></td>
                    <td><?php echo $rows_order->CUSTID   ;?></td>
                    <td>
                        <a href="updateOrder.php?upd_id=<?php echo $rows_order->ORDERID; ?>"><button class="Update_button" type="button">Update Order</button></a>
                    </td>
                    <td>
                        <a href="delete_order.php?del_id=<?php echo $rows_order->ORDERID; ?>"><button class="Delete_button" type="button">Delete Order</button></a>
                    </td>
                </tr>
                <?php endwhile; ?>  
            </tbody>
        </table>
        <a href="newOrder.php" target="_blank"><button class="New_button" type="button">Add New Order</button></a>

    </div>
    <br>
    <br>
    <div class="payments">
        <h2>Payments</h2>
        <table class="table">
            <thead>
                <tr>
                    <th>
                        Payment ID
                    </th>
                    <th>
                        Amount
                    </th>
                    <th>
                        Payment Type
                    </th>
                    <th>
                        Tax
                    </th>
                    <th>
                        Order ID
                    </th>
                    <th>
                        Update Entry
                    </th>
                    <th>
                        Delete Entry
                    </th>
                </tr>
            </thead>
            <tbody>
            <?php while($rows_payments = $data1->fetch(PDO::FETCH_OBJ)): ?>
                <tr>
                    <td><?php echo $rows_payments->PAYMENTID  ;?></td>
                    <td><?php echo $rows_payments->AMOUNT  ;?></td>
                    <td><?php echo $rows_payments->PAYMENTTYPE  ;?></td>
                    <td><?php echo $rows_payments->TAX  ;?></td>
                    <td><?php echo $rows_payments->ORDERID  ;?></td>
                    <td>
                    <a href="updatePayment.php?upd_id=<?php echo $rows_payments->PAYMENTID; ?>"><button class="Update_button" type="button">Update Order</button></a>
                    </td>
                    <td>
                    <a href="delete_payment.php?del_id=<?php echo $rows_payments->PAYMENTID; ?>"><button class="Delete_button" type="button">Delete Payment</button></a>
                    </td>
                </tr>
                <?php endwhile; ?>
            </tbody>
        </table>

        <a href="newPayment.php" target="_blank"><button class="New_button" type="button">Add New Payment</button></a>


    </div>
</body>

</html>