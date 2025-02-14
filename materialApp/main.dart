import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.deepOrangeAccent, // фоновый цвет
          title: Text('My App', style: TextStyle(color: Colors.white),),  //описание шапки
        ),
        body: SafeArea(     
                            // контейнер который берет безопасное пространство
          child: 
            //  row
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              
              // row
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // 
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 3
                    )
                  ),
                  child:Column(
                    children: [
                      Expanded(child: Image.asset("../assets/1.png")),
                      Text('User name'),
                    ],
                  )
                ),
                // Contaner
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 3
                    )
                  ),
                  child:Column(
                    children: [
                      Expanded(child: Image.asset("../assets/1.png")),
                      Text('User name'),
                    ],
                  )
                ),
              ],
             ),

            //  row

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 3
                    )
                  ),
                  child:Column(
                    children: [
                      Expanded(child: Image.asset("../assets/1.png")),
                      Text('User name'),
                    ],
                  )
                ),
                // 
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 3
                    )
                  ),
                  child:Column(
                    children: [
                      Expanded(child: Image.asset("../assets/1.png")),
                      Text('User name'),
                    ],
                  )
                ),
              ],
             ),
            //  
            ],
          ),
          
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){},
            child: Icon(Icons.accessibility_new_outlined, color: Colors.white,), // загрузка иконки
            backgroundColor: Colors.deepOrangeAccent,
            ),
      ),
    )
  );
}


