// import 'package:flutter/material.dart';

// void main() {
//   runApp(
//     MaterialApp(
//       title: 'Navigation App',
//       theme: ThemeData(
//         primarySwatch: Colors.deepOrange,
//       ),
//       home: HomeScreen(),
//     ),
//   );
// }

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.deepOrangeAccent,
//         centerTitle: true,
//         title: Text('Home Screen', style: TextStyle(fontSize: 22, color: Colors.white),),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: (){
//             Navigator.push(
//               context, 
//               MaterialPageRoute(builder: (context) => SecondScreen()));
//           }, 
//           child: Text('Link')),
//       ),
//     );
//   }
// }


// class SecondScreen extends StatelessWidget {
//   const SecondScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.deepOrangeAccent,
//         centerTitle: true,
//         title: Text('Second Screen', style: TextStyle(fontSize: 22, color: Colors.white),),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: (){
//             Navigator.pop(context);
//           }, 
//           child: Text('This is the Home screen'),
//           ),
//       ),
//     );
//   }
// }

