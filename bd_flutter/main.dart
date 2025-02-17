import 'package:flutter/material.dart'; // Импорт основных виджетов Flutter
import 'api_service.dart'; // Импорт вашего сервиса для получения данных

void main() {
  runApp(MyApp()); // Запуск приложения с корневым виджетом MyApp
}

class MyApp extends StatelessWidget { // Определение корневого виджета приложения
  @override
  Widget build(BuildContext context) { // Метод для построения виджета
    return MaterialApp( // Возвращает MaterialApp, который является основным виджетом для приложения
      debugShowCheckedModeBanner: false, // Отключает баннер отладки в верхнем правом углу
      home: UserListScreen(), // Устанавливает UserListScreen как главный экран приложения
    );
  }
}

class UserListScreen extends StatefulWidget { // Определение StatefulWidget, который может изменять свое состояние
  @override
  _UserListScreenState createState() => _UserListScreenState(); // Создание состояния для виджета
}

class _UserListScreenState extends State<UserListScreen> { // Определение состояния для UserListScreen
  late Future<List<Map<String, dynamic>>> users; // Объявление переменной users как Future, который будет содержать список пользователей

  @override
  void initState() { // Метод, который вызывается при инициализации состояния
    super.initState(); // Вызов метода initState у базового класса
    users = ApiService.fetchUsers(); // Инициализация users с результатом вызова метода fetchUsers из ApiService
  }

  @override
  Widget build(BuildContext context) { // Метод для построения виджета
    return Scaffold( // Возвращает Scaffold, который предоставляет базовую структуру визуального интерфейса
      appBar: AppBar( // Определение AppBar в верхней части экрана
        title: Text("Пользователи"), // Установка заголовка AppBar
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>( // Использование FutureBuilder для обработки асинхронных данных
        future: users, // Установка future для FutureBuilder
        builder: (context, snapshot) { // Метод builder, который определяет, что отображать в зависимости от состояния Future
          if (snapshot.connectionState == ConnectionState.waiting) { // Если данные еще загружаются
            return Center(child: CircularProgressIndicator()); // Отображает индикатор загрузки в центре экрана
          } else { // Если данные загружены
            final users = snapshot.data ?? []; // Получение данных из snapshot, если они есть, иначе пустой список
            return ListView.builder( // Возвращает ListView.builder для отображения списка пользователей
              itemCount: users.length, // Устанавливает количество элементов в списке
              itemBuilder: (context, index) { // Метод для построения каждого элемента списка
                final user = users[index]; // Получение текущего пользователя
                return ListTile( // Возвращает ListTile для отображения информации о пользователе
                  title: Text(user['name'] ?? 'Нет имени'), // Отображает имя пользователя или текст по умолчанию
                  subtitle: Text(user['email'] ?? 'Нет email'), // Отображает email пользователя или текст по умолчанию
                );
              },
            );
          }
        },
      ),
    );
  }
}
