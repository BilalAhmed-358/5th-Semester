<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New Ship</title>
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
        .New_button {
            background-color: #4CAF50;
            border: none;
            color: white;
            padding: 10px 10px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 13px;
            border-radius: 10px;    
            cursor: pointer;
            margin: 20px;
            min-width:100px;
            align:left;
        }
    </style>
</head>

<body>
    <div class="header">
        <p class="logo">New Ship</p>
    </div>
        <br><br>
    <div>
    <form action="insert_ship.php" method="POST" class="form" >
        <label for="shipid" class="row">Ship Id:</label>
        <input class="input" type="text" name="shipid" id="shipid" placeholder="Enter the Ship Id">
        <br>

        <label for="route" class="row">Route</label>
        <input class="input"  type="text" name="route" id="route" placeholder="Enter the Route">
        <br>
        
        <label for="LOCATION" class="row">Location</label>
        <input class="input"  type="text" name="LOCATION" id="LOCATION" placeholder="Enter the Location">
        <br>

        <!-- <label for="dockTime" class="row">Dock Time</label>
        <input class="input"  type="text" name="dockTime" id="dockTime" placeholder="Enter the Docking time">
        <br> -->
        
        <label for="noOfContainers" class="row">Number of containers</label>
        <input class="input"  type="text" name="noOfContainers" id="noOfContainers" placeholder="Enter the Number of containers">
        <br>

        <label for="WEIGHT" class="row">Weight</label>
        <input class="input"  type="text" name="WEIGHT" id="WEIGHT" placeholder="Enter the Weight in tonnes">
        <br>

        <label for="refuelDuration" class="row">Refuel Duration</label>
        <input class="input"  type="text" name="refuelDuration" id="refuelDuration" placeholder="Enter the Refuel Duration in minutes">
        <br>

        <label for="pricePerHour" class="row">Price per hour</label>
        <input class="input"  type="text" name="pricePerHour" id="pricePerHour" placeholder="Enter the price per hour">
        <br>

        <!-- <label for="arrivalDate" class="row">Arrival Date</label>
        <input class="input"  type="text" name="arrivalDate" id="arrivalDate" placeholder="Enter the arrival date">
        <br> -->

        <label for="portId" class="row">Port Id</label>
        <input class="input"  type="text" name="portId" id="portId" placeholder="Enter the Port Id">
        <br>
        
        <input class="New_button" id ="button_action" type="submit" name="submit" value="submit" class="btn btn-default">
    </form>
    </div>
</body>