<?php
include "conn.php";
$itemCode = $_POST['item_code'];
$itemName = $_POST['item_name'];
$price = $_POST['price'];
$stock = $_POST['stock'];

$conn->query("INSERT INTO tb_item(item_code, item_name, price, stock) 
        VALUES('".$itemCode."','".$itemName."','".$price."','".$stock."')");
?>