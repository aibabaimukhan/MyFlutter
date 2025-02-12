import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        title: Text('MyApp', style: TextStyle(fontSize: 22),),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Text('data', style: TextStyle(fontSize:22, color: Colors.white)),
            ],
        )
      ), 
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          // incrementCount();
        },
        child: Icon(Icons.add),
        ),
      );
  }
}