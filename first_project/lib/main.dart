import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Center(
                child: Text('My first App'),
              ),
            ),
            body: Column(
              children: [
                Container(
                  height: 100,
                  color: Colors.red,
                ),
                Row(
                  children: [
                    Container(
                      width: 150,
                      height: 100,
                      color: Colors.blue,
                    ),
                    Container(
                      width: 150,
                      height: 100,
                      color: Colors.green,
                    ),
                  ],
                )
              ],
            )));
  }
}
