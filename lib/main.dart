import 'package:flutter/material.dart';
import 'package:mancala_web/home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mancala WebApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(

        )
      ),
      home: DefaultTextStyle(style: TextStyle(decoration: TextDecoration.none),child: HomePage()),
    );
  }
}
