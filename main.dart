import 'package:flutter/material.dart';

void main() {
  runApp(Container(
    // color: Colors.grey,
    decoration: BoxDecoration(
      border: Border.all(
      color: Colors.red,
      width: 3,
    ),
    ),
    child: Column(
      children: [

          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 3,
                  color: Colors.blue,
                )
              ),
              child: Text(
                'header',
                textDirection: TextDirection.ltr,
              ),
            )
          ),











          Expanded(
            flex: 6,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 3,
                  color: Colors.blue,
                )
              ),
              child: Text(
                'content',
                textDirection: TextDirection.ltr,
              ),
            )
          ),

          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 5,
                  color: Colors.blue,
                )
              ),
              child: Row(
                textDirection: TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Text(
                  'footer',
                  textDirection: TextDirection.ltr,
                  ),

                  Text(
                  'footer',
                  textDirection: TextDirection.ltr,
                  ),

                  Text(
                  'footer',
                  textDirection: TextDirection.ltr,
                  ),
                ],
              )
            ),
          ),
        
      ],
    ),
  ),
  );
}


