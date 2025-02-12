import 'package:flutter/material.dart';
import 'package:test/stf.dart';
import 'package:test/list.dart';

void main() {
  runApp(
    MaterialApp(
      home: Home(),
    ),
  );
}

// // StatelessWidget

// class Home extends StatelessWidget {
//   const Home({super.key});

//   // int _count = 0;
//   // void incrementCount() {
//   //   setState(() {
//   //     _count++;
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black87,
//       appBar: AppBar(
//         backgroundColor: Colors.deepOrangeAccent,
//         centerTitle: true,
//         title: Text('MyApp', style: TextStyle(fontSize: 22),),
//       ),
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//            Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//                Text('Count: 0', style: TextStyle(color: Colors.white, fontSize: 22),),
//             ],
//            )
//           ],
//         )
//       ), 
//       floatingActionButton: FloatingActionButton(
//         onPressed: (){
//           // incrementCount();
//         },
//         child: Icon(Icons.add),
//         ),
//       );
//   }
// }

