import 'package:flutter/material.dart';

void main() => runApp(MyApp());

btnAction() {
  print("Botão Clicado");
}

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
                    color: Colors.red,
                  ),
                ),
                Row(
                  children: [
                    FlatButton(
                      height: 100,
                      child: Text('Home'),
                      color: Colors.blue,
                      onPressed: btnAction,
                    ),
                    Expanded(
                      child: Container(
                        height: 100,
                        color: Colors.green,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 100,
                        color: Colors.orange,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 100,
                        color: Colors.yellow,
                      ),
                    )
                  ],
                )
              ],
            )));
  }
}
