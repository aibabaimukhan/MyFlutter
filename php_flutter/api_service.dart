import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUrl = 'http://flutter/api.php'; // Базовый URL для API-запросов

  // Метод для получения данных с сервера
  Future<List<dynamic>> fetchData() async {
    try {
      final response = await http.get(Uri.parse(baseUrl)); // Отправляем GET-запрос на сервер

      if (response.statusCode == 200) {
        return json.decode(response.body); // Декодируем JSON-ответ и возвращаем список данных
      } else {
        throw Exception('Failed to load data: ${response.statusCode}'); // Если ошибка, выбрасываем исключение
      }
    } catch (e) {
      throw Exception('Error: $e'); // Обрабатываем возможные ошибки соединения
    }
  }

  // Метод для добавления нового пользователя в базу данных
  Future<void> addData(String name, String email) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl), // Отправляем POST-запрос на сервер
        headers: {'Content-Type': 'application/json'}, // Заголовки указывают, что отправляем JSON
        body: json.encode({'name': name, 'email': email}), // Кодируем данные в JSON
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to add data'); // Если ошибка, выбрасываем исключение
      }
    } catch (e) {
      throw Exception('Error: $e'); // Обрабатываем возможные ошибки соединения
    }
  }

  // Метод для удаления пользователя из базы данных
  Future<void> deleteData(int id) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl?id=$id'), // Отправляем DELETE-запрос, передавая ID в URL
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to delete data'); // Если ошибка, выбрасываем исключение
      }
    } catch (e) {
      throw Exception('Error: $e'); // Обрабатываем возможные ошибки соединения
    }
  }
}
