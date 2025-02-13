import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    )
  );
}



class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

// список который принимает значение чтобы в дальнейшем отобразить 
  List items =  [];
  //  переменная которая будет принимать значение от инпута
  String inputText = '';
  // функция для добавления значения в список items
  void addItems(value){
    // проверка на пустоту и заполняемть поля
    if(value.isNotEmpty) {
      setState(() {
        items.add(value);
      });
      inputText = '';  // очищаем поле ввода после добавления
    }else{
      // print('error');
      showDialog(
        context: context, 
        builder: (context){
          return AlertDialog(
            title: Text('Поле ввода пустое'),
          );
        }
        );
    }
  }
  // функция для удаления значения из списока items
  void removeItems(int index) {
    setState(() {
      items.removeAt(index);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AppBar'), backgroundColor: Colors.deepOrangeAccent,),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index){
            return Padding(padding: EdgeInsets.all(10),
            child: ListTile(
              tileColor: Colors.green,
              // отабражение добавленных значении в виде списка
              title: Text( (items[index]).toString()),
              // кнопка для удаления
              trailing: IconButton(
                onPressed: (){
                  // вызываем функцию для удаления
                  removeItems(index);
              }, 
              icon: Icon(Icons.delete)),
            ),
            );
          },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //  открытие диалогового окна при нажатии на кнопку
          showDialog(
            context: context, 
            builder: (context){
              return AlertDialog(
                title: Text('Add context'),
                content: TextField(
                  onChanged: (value){
                    inputText = value;
                  },
                ),
                actions: [
                  ElevatedButton(
                    onPressed: (){
                      // запуск функции для добавления
                        addItems(inputText);
                      //  закрытие диологового окна
                      Navigator.of(context).pop();
                    }, 
                    child: Text('ADD'), 
                    ),
                ],
              );
            });
        },
        child: Icon(Icons.add),
        ),
    );
  }
}

//////////////////////////////////////////////////////////////////
///
/// animation
/// 
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   bool _big = false;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text("AnimatedContainer")),
//         body: Center(
//           child: GestureDetector(
//             onTap: () {
//               setState(() {
//                 _big = !_big;
//               });
//             },
//             child: AnimatedContainer(
//               duration: Duration(seconds: 1),
//               curve: Curves.easeInOut,
//               width: _big ? 200 : 100,
//               height: _big ? 200 : 100,
//               decoration: BoxDecoration(
//                 color: _big ? Colors.blue : Colors.red,
//                 borderRadius: BorderRadius.circular(_big ? 50 : 10),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: AnimationExample(),
//     );
//   }
// }

// class AnimationExample extends StatefulWidget {
//   @override
//   _AnimationExampleState createState() => _AnimationExampleState();
// }

// class _AnimationExampleState extends State<AnimationExample> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 2),
//     )..repeat(reverse: true);
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("AnimationController")),
//       body: Center(
//         child: AnimatedBuilder(
//           animation: _controller,
//           builder: (context, child) {
//             return Transform.scale(
//               scale: 1 + _controller.value,
//               child: Container(width: 100, height: 100, color: Colors.blue),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

//////////////////////////////////////////////////////////////////
///
///
///     вкладки

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyTabs(),
//     );
//   }
// }

// class MyTabs extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3, // Количество вкладок
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("Вкладки в Flutter"),
//           bottom: TabBar(
//             tabs: [
//               Tab(icon: Icon(Icons.home), text: "Главная"),
//               Tab(icon: Icon(Icons.settings), text: "Настройки"),
//               Tab(icon: Icon(Icons.person), text: "Профиль"),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             Center(child: Text("Главная страница")),
//             Center(child: Text("Настройки")),
//             Center(child: Text("Профиль")),
//           ],
//         ),
//       ),
//     );
//   }
// }

// //////////////////////////////////////////////////////////////


// gredview


// ///////////////////////////////////////////////////////////

// class HomeCount extends StatefulWidget {
//   const HomeCount({super.key});

//   @override
//   State<HomeCount> createState() => _HomeCountState();
// }

// class _HomeCountState extends State<HomeCount> {

//   List items = [1, 2, 3];

//   void add (){
//     setState(() {
//        items.add(items.length + 1);
//     });
//   }

//   void remove (){
//     setState(() {
//        items.removeLast();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('data'),
//         backgroundColor: Colors.deepOrangeAccent,
//         ),
//       body: ListView(
//         children: [
//           Text("Категории", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
//           GridView.builder(
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 3, // Количество столбцов
//               crossAxisSpacing: 10,
//               mainAxisSpacing: 10,
//             ),
//             itemCount: items.length,
//             itemBuilder: (context, index) {
//               return Container(
//                 color: Colors.blue,
//                 child: Column(
//                   children: [
//                     Center(child: Text("Элемент $index")),
//                     ElevatedButton(onPressed: (){
//                       remove();
//                     }, 
//                     child: Icon(Icons.delete)),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ],
// )
// ,
// floatingActionButton: FloatingActionButton(
//   onPressed: (){
//     add();
//   },
//   child: Icon(Icons.add),
// ),
//     );
//   }
// }

////////////////////////////////////////////////////////
///
///   listview

// ///////////////////////////////////////////////////////
// class HomeCount extends StatefulWidget {
//   const HomeCount({super.key});

//   @override
//   State<HomeCount> createState() => _HomeCountState();
// }

// class _HomeCountState extends State<HomeCount> {
//   List<int> items = [1, 2, 3];
//   void addItems (){
//     setState(() {
//       items.add(items.length + 1);
//     });
//   }
//   void removeItems (int index) {
//     setState(() {
//       items.removeAt(index);
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.deepOrangeAccent,
//         title: Text('data')
//         ),
//       body: Center(
//         child: ListView.builder(
//           itemCount: items.length,
//           itemBuilder: (context, index){
//             return Padding(padding: EdgeInsets.all(10),
//             child: ListTile(
//               tileColor: Colors.green,
//               title: Text( (items[index]).toString()),
//               trailing: IconButton(
//                 onPressed: (){
//                   removeItems(index);
//               }, 
//               icon: Icon(Icons.delete)),
//             ),
//             );
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: addItems,
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
