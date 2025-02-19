<?php
// Устанавливаем заголовки для работы с JSON и CORS (разрешаем запросы с любых источников)
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *"); // Разрешаем доступ со всех доменов
header("Access-Control-Allow-Methods: GET, POST, DELETE, OPTIONS"); // Разрешенные методы
header("Access-Control-Allow-Headers: Content-Type"); // Разрешаем заголовок Content-Type

// Данные для подключения к базе данных
$servername = "localhost";  // Хост (обычно localhost)
$username = "root";         // Имя пользователя базы данных
$password = "root";         // Пароль от базы данных
$dbname = "flutter";        // Название базы данных

// Подключение к базе данных
$conn = mysqli_connect($servername, $username, $password, $dbname);

// Проверка соединения с базой
if (!$conn) {
    die(json_encode(["message" => "Database connection failed: " . mysqli_connect_error()]));
}

// ОБРАБОТКА POST-ЗАПРОСА (Добавление пользователя)
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Получаем JSON-данные из тела запроса
    $data = json_decode(file_get_contents('php://input'), true);

    // Проверяем, переданы ли необходимые параметры
    if (!isset($data['name']) || !isset($data['email'])) {
        echo json_encode(["message" => "Name and email are required"]);
        exit;
    }

    // Фильтруем входные данные, чтобы избежать SQL-инъекций
    $name = mysqli_real_escape_string($conn, $data['name']);
    $email = mysqli_real_escape_string($conn, $data['email']);

    // SQL-запрос на добавление нового пользователя
    $sql = "INSERT INTO users (name, email) VALUES ('$name', '$email')";

    // Выполняем запрос
    if (mysqli_query($conn, $sql)) {
        // Возвращаем ID добавленного пользователя
        echo json_encode(["message" => "User added successfully", "id" => mysqli_insert_id($conn)]);
    } else {
        // В случае ошибки выводим её
        echo json_encode(["message" => "Error: " . mysqli_error($conn)]);
    }
    exit;
}

// ОБРАБОТКА DELETE-ЗАПРОСА (Удаление пользователя)
if ($_SERVER['REQUEST_METHOD'] == 'DELETE') {
    // Получаем JSON-данные из тела запроса
    $data = json_decode(file_get_contents('php://input'), true);
    
    // Берем ID либо из JSON, либо из GET-запроса
    $id = $data['id'] ?? $_GET['id'] ?? null;

    // Проверяем, передан ли ID и является ли он числом
    if (!$id || !is_numeric($id)) {
        echo json_encode(['message' => 'ID not provided or invalid']);
        exit;
    }

    // Приводим ID к целому числу (дополнительная защита)
    $id = intval($id);

    // SQL-запрос на удаление пользователя по ID
    $sql = "DELETE FROM users WHERE id = $id";

    // Выполняем запрос
    if (mysqli_query($conn, $sql)) {
        echo json_encode(['message' => 'Record deleted successfully']);
    } else {
        echo json_encode(['message' => 'Error: ' . mysqli_error($conn)]);
    }
    exit;
}

// ОБРАБОТКА GET-ЗАПРОСА (Получение всех пользователей)
if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    // Запрос к базе данных на получение всех пользователей
    $result = mysqli_query($conn, "SELECT * FROM users");
    
    // Создаём массив для хранения пользователей
    $users = [];

    // Перебираем полученные данные и добавляем их в массив
    while ($row = mysqli_fetch_assoc($result)) {
        $users[] = $row;
    }

    // Отправляем массив пользователей в формате JSON
    echo json_encode($users);
    exit;
}

// Закрываем соединение с базой данных
mysqli_close($conn);
?>
