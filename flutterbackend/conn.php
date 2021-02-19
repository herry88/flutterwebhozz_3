<?php
//koneksi
$conn = new mysqli("localhost","root","","dblogin");
if($conn){

} else{
    echo "Connection Failed";
    exit();
}

?>