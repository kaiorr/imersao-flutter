import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'Hello Dartzinho seu lindo!',
      textDirection: TextDirection.ltr,
    ));
  }
}
