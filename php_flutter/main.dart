import 'package:flutter/material.dart';
import 'api_service.dart';  // Импортируем класс для работы с API

void main() {
  runApp(MyApp());  // Запускаем приложение
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserListScreen(),  // Устанавливаем главный экран
    );
  }
}

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  late ApiService apiService;  // Экземпляр сервиса API
  List<dynamic> users = [];  // Список пользователей

  @override
  void initState() {
    super.initState();
    apiService = ApiService();  // Инициализируем сервис API
    fetchUsers();  // Загружаем список пользователей
  }

  // Метод для загрузки пользователей из API
  void fetchUsers() async {
    try {
      final userData = await apiService.fetchData();  // Запрос данных
      setState(() {
        users = userData;  // Обновляем список пользователей
      });
    } catch (e) {
      print("Ошибка при выборке пользователей: $e");
    }
  }

  var count = 0;  // Счетчик для генерации имен новых пользователей

  // Метод для добавления нового пользователя
  void addUser() async {
    count++;  // Увеличиваем счетчик
    print("Current count: $count");
    await apiService.addData('New User $count', 'newuser$count@example.com');  // Отправляем данные на сервер
    fetchUsers();  // Обновляем список после добавления
  }

  // Метод для удаления пользователя по ID
  void deleteUser(int id) async {
    try {
      await apiService.deleteData(id);  // Удаляем пользователя через API
      fetchUsers();  // Обновляем список после удаления
    } catch (e) {
      print("Ошибка при удалении пользователя: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),  // Заголовок в AppBar
      ),
      body: users.isEmpty
          ? Center(child: Text('No users found'))  // Если пользователей нет, выводим сообщение
          : ListView.builder(
              itemCount: users.length,  // Количество элементов списка
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(users[index]['name']),  // Отображаем имя пользователя
                  subtitle: Text(users[index]['email']),  // Отображаем email пользователя
                  trailing: IconButton(
                    icon: Icon(Icons.delete),  // Иконка удаления
                    onPressed: () => deleteUser(int.parse(users[index]['id'])),  // Удаление пользователя по ID
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: addUser,  // Добавление нового пользователя
        child: Icon(Icons.add),  // Иконка кнопки добавления
      ),
    );
  }
}
