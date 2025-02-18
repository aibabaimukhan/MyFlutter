<?php
$host = 'localhost';  // или ваш хост
$username = 'root';
$password = 'root';
$dbname = 'flutter';

$conn = new mysqli($host, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
