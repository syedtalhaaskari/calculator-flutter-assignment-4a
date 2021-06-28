import 'package:calculator/Calculator.dart';
import 'package:flutter/material.dart';
import './Calculator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFF808080)),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Calculator(),
      )
    );
  }
}