// import 'package:flutter/material.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {

//   int _count = 0;

//   void incrementCount() {
//     setState(() {
//       _count++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black87,
//       appBar: AppBar(
//         backgroundColor: Colors.deepOrangeAccent,
//         centerTitle: true,
//         title: Text(
//           'MyApp', 
//           style: TextStyle(
//             fontSize: 22, 
//             color:Colors.white, 
//             fontWeight: FontWeight.bold
//             ),
//             ),
//       ),
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                  Text('Count: $_count', style: TextStyle(color: Colors.white, fontSize: 22),),
//               ],
//             )
//           ],
//         ),
//       ), 
//       floatingActionButton: FloatingActionButton(
//         onPressed: (){
//           incrementCount();
//         },
//         child: Icon(Icons.add),
//         ),
//       );;
//   }
// }