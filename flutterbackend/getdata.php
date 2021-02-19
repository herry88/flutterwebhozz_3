<?php
include 'conn.php';
$query =$conn->query("SELECT * FROM tb_item ");

//variabel untuk menampung data 
$hasil = array();

while($fetchData = $query->fetch_assoc()){
    $hasil[] = $fetchData;
}

echo json_encode($hasil);

?>