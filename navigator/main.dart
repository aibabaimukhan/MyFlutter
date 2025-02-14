import 'package:flutter/material.dart'; 
 
void main() { 
  runApp(MyApp()); 
} 
 
class MyApp extends StatelessWidget { 
  @override 
  Widget build(BuildContext context) { 
    return MaterialApp( 
      initialRoute: '/', // Стартовый маршрут 
      routes: { 
        '/': (context) => HomeScreen(), // Маршрут для главной страницы 
        '/second': (context) => SecondScreen(), 
        '/third': (context) => ThirdScreen(), // Маршрут для второй страницы 
      }, 
    ); 
  } 
} 
 
// Главная страница 
class HomeScreen extends StatelessWidget { 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar( 
        backgroundColor: Colors.deepOrangeAccent, 
        title: Text('Главная страница'), 
      ), 
      body: Center( 
        child: ElevatedButton( 
          onPressed: () { 
            // Переход на вторую страницу по имени маршрута 
            Navigator.pushNamed(context, '/second'); 
          }, 
          child: Text('Перейти на вторую страницу'), 
        ), 
      ), 
    ); 
  } 
} 
 
// Вторая страница 
class SecondScreen extends StatelessWidget { 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar( 
        backgroundColor: Colors.deepOrangeAccent, 
        title: Text('Вторая страница'), 
      ), 
      body: Center( 
        child: Column( 
          children: [ 
            ElevatedButton( 
              onPressed: () { 
                // Возврат на главную страницу 
                Navigator.pop(context); 
              }, 
              child: Text('Вернуться на главную'), 
            ), 
            ElevatedButton( 
              onPressed: () { 
                // переход на след страницу
                Navigator.pushNamed(context, '/third'); 
                // Navigator.popAndPushNamed(context, '/third');
              }, 
              child: Text('Перейти на третюю страницу'), 
            ), 
          ], 
        ), 
      ), 
    ); 
  } 
} 
 
class ThirdScreen extends StatelessWidget { 
  const ThirdScreen({super.key}); 
 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
       appBar: AppBar( 
        backgroundColor: Colors.deepOrangeAccent, 
        title: Text('Третяя страница'), 
      ), 
      body: Center( 
        child: Column(
          children: [
            // 
            ElevatedButton( 
              onPressed: () { 
                // Возврат на главную страницу 
                Navigator.pop(context); 
              }, 
              child: Text('Вернуться на вторую страницу'), 
            ), 
            // 
            ElevatedButton( 
              onPressed: () { 
                // Возврат на главную страницу 
                Navigator.pushNamed(context, '/'); 
              }, 
              child: Text('Вернуться на главную'), 
            ), 
            // 
          ],
        )
      ), 
    ); 
  } 
}
