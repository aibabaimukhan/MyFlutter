import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://flutter";

  static Future<List<Map<String, dynamic>>> fetchUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/get_user.php'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == 'success') {
        return List<Map<String, dynamic>>.from(data['users']);
      } else {
        throw Exception("Ошибка: ${data['message']}");
      }
    } else {
      throw Exception("Ошибка соединения: ${response.statusCode}");
    }
  }
}
