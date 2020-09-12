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
                Expanded(
                  child: Container(
                    height: 100,
                    color: Colors.red,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 80,
                        color: Colors.blue,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 80,
                        color: Colors.green,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 80,
                        color: Colors.orange,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 80,
                        color: Colors.yellow,
                      ),
                    )
                  ],
                )
              ],
            )));
  }
}
