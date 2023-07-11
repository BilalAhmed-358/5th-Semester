<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New Container</title>
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
        <p class="logo">New Container</p>
    </div>
        <br><br>
    <div>
    <form action="insert_container.php" method="POST" class="form" >
        <label for="containerid" class="row">Container Id:</label>
        <input class="input" type="text" name="containerid" id="containerid" placeholder="Enter the containerid">
        <br>

        <label for="goods_name" class="row">Good's Name:</label>
        <input class="input"  type="text" name="goods_name" id="goods_name" placeholder="Enter the Good's Name">
        <br>

        <label for="shipid" class="row">Ship ID:</label>
        <input class="input"  type="text" name="shipid" id="shipid" placeholder="Enter the new Ship ID">
        <br>
        <input class="New_button" id ="button_action" type="submit" name="submit" value="submit" class="btn btn-default">
    </form>
    </div>
</body>