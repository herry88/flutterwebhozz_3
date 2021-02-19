<?php
include 'conn.php';

$id = $_POST['id'];
$itemCode = $_POST['item_code'];
$itemName = $_POST['item_name'];
$price = $_POST['price'];
$stock = $_POST['stock'];

$conn->query("UPDATE tb_item SET item_code ='".$itemCode."', 
                                 item_name ='".$itemName."',
                                 price = '".$price."',
                                 stock = '".$stock."'
                                 WHERE id =".$id);
?>