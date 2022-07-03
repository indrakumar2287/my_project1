import 'package:flutter/material.dart';
import 'package:my_project1/main.dart';
import 'homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var number = 100;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : homepage(),
    );
  }
}
