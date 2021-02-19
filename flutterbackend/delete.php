<?php
include "conn.php";
$id = $_POST['id'];

$conn->query("DELETE FROM tb_item WHERE id =".$id);
?>