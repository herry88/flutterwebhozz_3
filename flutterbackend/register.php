<?php
//koneksiDb
$db = mysqli_connect("localhost","root","","dblogin");

if(!$db){
    echo "Failed Connection";
}
//deklarasi variabel
$username = $_POST['username'];
$password = $_POST['password'];

//query SQL 
$sql = "SELECT username FROM login WHERE username ='".$username."'";
$hasil = mysqli_query($db, $sql);
$count = mysqli_num_rows($hasil);

if($count == 1){
    echo json_encode('Error');
} else{
    $insert = "INSERT INTO login(username, password)VALUES('".$username."','".$password."')";
    $query = mysqli_query($db, $insert);
    if($query){
        echo json_encode('Succes');
    }
}
?>