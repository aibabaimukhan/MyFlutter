<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");

$servername = "localhost";  // Ваш хост
$username = "root";         // Ваш логин БД
$password = "root";             // Ваш пароль БД
$dbname = "flutter";  // Имя базы данных

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die(json_encode(["message" => "Database connection failed: " . $conn->connect_error]));
}

// ОБРАБОТКА DELETE-ЗАПРОСА
if ($_SERVER['REQUEST_METHOD'] == 'DELETE') {
    // Получаем ID из JSON или GET
    $data = json_decode(file_get_contents('php://input'), true);
    $id = $data['id'] ?? $_GET['id'] ?? null;

    if (!$id || !is_numeric($id)) {
        echo json_encode(['message' => 'ID not provided or invalid']);
        exit;
    }

    $id = intval($id);  // Приведение к числу для защиты

    $sql = "DELETE FROM users WHERE id = $id";
    if ($conn->query($sql) === TRUE) {
        echo json_encode(['message' => 'Record deleted successfully']);
    } else {
        echo json_encode(['message' => 'Error: ' . $conn->error]);
    }
    exit;
}

// ОБРАБОТКА GET-ЗАПРОСА (по умолчанию)
if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    $result = $conn->query("SELECT * FROM users");
    $users = [];
    while ($row = $result->fetch_assoc()) {
        $users[] = $row;
    }
    echo json_encode($users);
    exit;
}

$conn->close();
?>
