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
      home: UserGridScreen(), // Устанавливает UserGridScreen как главный экран приложения
    );
  }
}

class UserGridScreen extends StatefulWidget { // Новый класс для отображения в GridView
  @override
  _UserGridScreenState createState() => _UserGridScreenState(); // Создание состояния для виджета
}

class _UserGridScreenState extends State<UserGridScreen> { // Определение состояния для UserGridScreen
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
        title: Text("Пользователи в GridView"), // Установка заголовка AppBar
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>( // Использование FutureBuilder для обработки асинхронных данных
        future: users, // Установка future для FutureBuilder
        builder: (context, snapshot) { // Метод builder, который определяет, что отображать в зависимости от состояния Future
          if (snapshot.connectionState == ConnectionState.waiting) { // Если данные еще загружаются
            return Center(child: CircularProgressIndicator()); // Отображает индикатор загрузки в центре экрана
          } else if (snapshot.hasError) { // Если произошла ошибка
            return Center(child: Text("Ошибка: ${snapshot.error}")); // Отображает сообщение об ошибке
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) { // Если данных нет или они пустые
            return Center(child: Text("Нет пользователей")); // Отображает сообщение об отсутствии данных
          }

          final users = snapshot.data!; // Получение данных из snapshot
          return GridView.builder( // Возвращает GridView.builder для отображения данных в виде сетки
            padding: EdgeInsets.all(10), // Устанавливает отступы для сетки
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( // Определяет количество столбцов и расстояние между ними
              crossAxisCount: 2, // Количество столбцов
              crossAxisSpacing: 10, // Расстояние между столбцами
              mainAxisSpacing: 10, // Расстояние между строками
            ),
            itemCount: users.length, // Количество элементов в сетке
            itemBuilder: (context, index) { // Метод для построения каждого элемента сетки
              final user = users[index]; // Получение текущего пользователя
              return GestureDetector( // Использование GestureDetector для обработки нажатий
                onTap: () { // Обработчик нажатия на элемент
                  // Здесь можно добавить логику для обработки нажатий на пользователя
                  print('Нажат пользователь: ${user['name']}');
                },
                child: Card( // Использование Card для отображения информации о пользователе
                  child: Column( // Использование Column для размещения элементов вертикально
                    mainAxisAlignment: MainAxisAlignment.center, // Центрирование элементов по вертикали
                    children: [ // Список элементов для отображения
                      CircleAvatar( // Использование CircleAvatar для отображения инициала пользователя
                        radius: 30, // Радиус CircleAvatar
                        child: Text( // Текст внутри CircleAvatar
                          user['name'][0].toUpperCase(), // Первая буква имени пользователя в верхнем регистре
                          style: TextStyle(fontSize: 24), // Стиль текста
                        ),
                      ),
                      SizedBox(height: 10), // Промежуток между элементами
                      Text( // Отображение имени пользователя
                        user['name'], // Имя пользователя
                        style: TextStyle(fontSize: 18), // Стиль текста
                      ),
                      Text( // Отображение email пользователя
                        user['email'], // Email пользователя
                        style: TextStyle(color: Colors.grey), // Стиль текста с серым цветом
                      ),
                      ElevatedButton(
                        onPressed: (){}, 
                        child: Icon(Icons.delete),
                        ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton( // Добавление кнопки действия
        onPressed: () { // Обработчик нажатия на кнопку
          showDialog( // Отображение диалогового окна
            context: context, 
            builder: (context) { // Метод для построения диалогового окна
              return AlertDialog( // Возвращает AlertDialog
                title: Text('Add context'), // Заголовок диалогового окна
                content: Column(
                  children: [
                    TextField( // Поле для ввода текста
                      onChanged: (value) { // Обработчик изменения текста
                        // Здесь можно добавить логику для обработки ввода
                      },
                    ),
                    TextField( // Поле для ввода текста
                      onChanged: (value) { // Обработчик изменения текста
                        // Здесь можно добавить логику для обработки ввода
                      },
                    ),
                  ],
                ),
                actions: [ // Список действий в диалоговом окне
                  ElevatedButton( // Кнопка для добавления данных
                    onPressed: () { // Обработчик нажатия на кнопку
                      Navigator.of(context).pop(); // Закрытие диалогового окна
                    }, 
                    child: Text('ADD'), // Текст на кнопке
                  ),
                ],
              );
            }
          );
        }, 
        child: Icon(Icons.add), // Иконка на кнопке
      ),
    );
  }
}
