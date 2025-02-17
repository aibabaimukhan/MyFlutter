<?php
$host = "localhost";  // Сервер базы данных
$user = "root";       // Логин БД (по умолчанию root)
$pass = "root";           // Пароль БД (по умолчанию пусто)
$dbname = "flutter";  // Имя базы данных

$conn = new mysqli($host, $user, $pass, $dbname);

if ($conn->connect_error) {
    die(json_encode(["status" => "error", "message" => "Ошибка подключения: " . $conn->connect_error]));
}
?>
