import 'dart:convert'; // Импорт библиотеки для работы с JSON
import 'package:http/http.dart' as http; // Импорт пакета http для выполнения HTTP-запросов

class ApiService { // Определение класса ApiService
  static const String baseUrl = "http://flutter"; // Определение базового URL для API

  // Метод для получения списка пользователей
  static Future<List<Map<String, dynamic>>> fetchUsers() async { // Определение асинхронного метода fetchUsers
    final response = await http.get(Uri.parse('$baseUrl/get_user.php')); // Выполнение GET-запроса к API

    // Проверка, что запрос выполнен успешно (статус код 200)
    if (response.statusCode == 200) { 
      // Декодирование тела ответа из JSON в объект Dart
      final data = json.decode(response.body); 

      // Проверка, что статус в ответе "success"
      if (data['status'] == 'success') { 
        // Преобразование списка пользователей из JSON в список Map в Dart
        return List<Map<String, dynamic>>.from(data['users']); 
      } else { 
        // Если статус не "success", выбрасывается исключение с сообщением об ошибке
        throw Exception("Ошибка: ${data['message']}"); 
      }
    } else { 
      // Если статус код не 200, выбрасывается исключение с кодом ошибки
      throw Exception("Ошибка соединения: ${response.statusCode}"); 
    }
  }
}
