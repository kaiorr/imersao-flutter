import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:singleton/singleton/singleton_factory.dart';
import 'package:singleton/singleton/singleton_raiz.dart';

class SingletonPattern extends StatefulWidget {
  @override
  _SingletonPatternState createState() => _SingletonPatternState();
}

class _SingletonPatternState extends State<SingletonPattern> {
  @override
  void initState() {
    super.initState();
    int i = 0;
    while (i <= 10) {
      // print(SingletonRaiz.instance.id);
      print(SingletonFactory().id);
      i++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Singleton')),
      body: Container(),
    );
  }
}
