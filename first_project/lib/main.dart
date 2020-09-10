import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

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
          Row(
            children: [
              Expanded(
                  child: Text(
                'Nome',
              )),
              Expanded(child: Text('Sobrenome'))
            ],
          ),
        ],
      ),
    ));
  }
}
